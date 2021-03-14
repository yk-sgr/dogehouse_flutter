import 'package:dogehouse_flutter/provider/doge_provider.dart';
import 'package:dogehouse_flutter/screens/call/call_chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CallScreen extends StatefulWidget {
  final String callID;

  CallScreen(this.callID);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  void initState() {
    Provider.of<DogeProvider>(context, listen: false).joinRoom(widget.callID);
    super.initState();
  }

  @override
  void deactivate() {
    Provider.of<DogeProvider>(context, listen: false).leaveRoom();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    print(_size.width);
    return Consumer<DogeProvider>(builder: (context, model, _) {
      return Scaffold(
          body: model.currentRoom != null
              ? Center(
                  child: SafeArea(
                      child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 4,
                      child: CallChat(),
                    ),
                  ])),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ));
    });
  }
}
