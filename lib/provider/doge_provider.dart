import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dogehouse_flutter/models/auth_model.dart';
import 'package:dogehouse_flutter/models/models.dart';
import 'package:dogehouse_flutter/resources/api.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

class DogeProvider with ChangeNotifier {
  WebSocketChannel channel;
  UseSocketStatus useSocketStatus;
  bool authGood;
  AuthModel authModel = AuthModel();
  PublicRoomsQuery publicRoomsQuery = PublicRoomsQuery(rooms: []);
  ScheduledRoomsInfo scheduledRoomsInfo = ScheduledRoomsInfo(scheduledRooms: []);

  Room currRoom;
  CurrentRoom currentRoom;
  List currMessages = [];

  String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  Future<void> connectWS() async {
    if (authModel.accessToken == null || authModel.refreshToken == null) {
      var res = await http.get(Uri.http(AppApi.apiBase, AppApi.apiDevLogin, {'username': getRandString(12)}));
      authModel = AuthModel.fromJson(jsonDecode(res.body));
    }

    useSocketStatus = UseSocketStatus.connecting;
    channel = IOWebSocketChannel.connect('ws://' + AppApi.wsBase + '/socket');
    channel.sink.add(jsonEncode({"op": "auth", "d": authModel.toJson()}));
    channel.stream.listen(
      (dynamic message) {
        if (message == '"pong"') {
          return;
        }
        var json = jsonDecode(message);
        debugPrint('Op: ' + json["op"].toString());
        switch (json["op"]) {
          case "new-tokens":
            authModel.accessToken = json["d"]["accessToken"];
            authModel.refreshToken = json["d"]["refreshToken"];
            break;
          case "join_room_done":
            currRoom = Room.fromJson(json["d"]["room"]);
            notifyListeners();
            break;
          case "get_current_room_users_done":
            currentRoom = CurrentRoom.fromJson(json["d"]);
            notifyListeners();
            break;
          case "error":
            debugPrint("error");
            break;
          default:
            useSocketStatus = UseSocketStatus.authGood;
            if (json["op"] == "auth-good") {
              authGood = true;
            }
            if (json["op"] == "fetch_done") {
              switch (json["d"].keys.toList()[0]) {
                case 'rooms':
                  publicRoomsQuery = PublicRoomsQuery.fromJson(json["d"]);
                  notifyListeners();
                  break;
                case 'scheduledRooms':
                  scheduledRoomsInfo = ScheduledRoomsInfo.fromJson(json["d"]);
                  notifyListeners();
                  break;
              }
            }
            break;
        }
      },
      onDone: () {
        useSocketStatus = UseSocketStatus.closed;
        debugPrint('ws channel closed');
      },
      onError: (error) {
        useSocketStatus = UseSocketStatus.closed;
        debugPrint('ws error $error');
      },
    );
    //  channel.sink.add(jsonEncode({"op": "get_my_scheduled_rooms_about_to_start", "d": {}, "fetchId": ""}));
    channel.sink.add(jsonEncode({
      "op": "get_scheduled_rooms",
      "d": {"cursor": "", "getOnlyMyScheduledRooms": false},
      "fetchId": ""
    }));
    channel.sink.add(jsonEncode({
      "op": "get_top_public_rooms",
      "d": {"cursor": 0},
      "fetchId": ""
    }));

    channel.sink.add(jsonEncode({
      "op": "fetch_following_online",
      "d": {"cursor": 0}
    }));

    Timer.periodic(new Duration(seconds: 8), (timer) {
      if (useSocketStatus == UseSocketStatus.authGood) {
        channel.sink.add("ping");
      } else {
        timer.cancel();
      }
    });
  }

  leaveRoom() {
    channel.sink.add(jsonEncode({"op": "leave_room", "d": {}}));
  }

  joinRoom(String roomID) {
    channel.sink.add(jsonEncode({
      "op": "join_room",
      "d": {"roomId": roomID}
    }));

    channel.sink.add(jsonEncode({"op": "get_current_room_users", "d": {}}));

    channel.sink.add(jsonEncode({
      "op": "@get-recv-tracks",
      "d": {
        "rtpCapabilities": {
          "codecs": [
            {
              "mimeType": "audio/opus",
              "kind": "audio",
              "preferredPayloadType": 100,
              "clockRate": 48000,
              "channels": 2,
              "parameters": {"minptime": 10, "useinbandfec": 1},
              "rtcpFeedback": [
                {"type": "transport-cc", "parameter": ""}
              ]
            }
          ],
          "headerExtensions": [
            {"kind": "audio", "uri": "urn:ietf:params:rtp-hdrext:sdes:mid", "preferredId": 1, "preferredEncrypt": false, "direction": "sendrecv"},
            {"kind": "video", "uri": "urn:ietf:params:rtp-hdrext:sdes:mid", "preferredId": 1, "preferredEncrypt": false, "direction": "sendrecv"},
            {
              "kind": "audio",
              "uri": "http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time",
              "preferredId": 4,
              "preferredEncrypt": false,
              "direction": "sendrecv"
            },
            {
              "kind": "video",
              "uri": "http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time",
              "preferredId": 4,
              "preferredEncrypt": false,
              "direction": "sendrecv"
            },
            {
              "kind": "video",
              "uri": "http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01",
              "preferredId": 5,
              "preferredEncrypt": false,
              "direction": "sendrecv"
            },
            {
              "kind": "audio",
              "uri": "urn:ietf:params:rtp-hdrext:ssrc-audio-level",
              "preferredId": 10,
              "preferredEncrypt": false,
              "direction": "sendrecv"
            },
            {"kind": "video", "uri": "urn:3gpp:video-orientation", "preferredId": 11, "preferredEncrypt": false, "direction": "sendrecv"},
            {"kind": "video", "uri": "urn:ietf:params:rtp-hdrext:toffset", "preferredId": 12, "preferredEncrypt": false, "direction": "sendrecv"}
          ]
        }
      }
    }));

    channel.sink.add(jsonEncode({
      "op": "@connect-transport",
      "d": {
        "transportId": "68c0cf24-ced8-4dd1-9d90-cb38de685811",
        "dtlsParameters": {
          "role": "client",
          "fingerprints": [
            {"algorithm": "sha-256", "value": "D4:BC:B3:AD:C4:99:C0:80:7F:7C:51:C0:31:7A:DE:1B:8A:DC:EF:AC:AE:84:38:BF:73:72:F1:D0:32:75:83:AF"}
          ]
        },
        "direction": "recv"
      }
    }));
  }

  sendMessage(String text) {
    channel.sink.add(jsonEncode({
      "op": "send_room_chat_msg",
      "d": {
        "tokens": [
          {"t": "text", "v": text}
        ],
        "whisperedTo": []
      }
    }));
  }
}
