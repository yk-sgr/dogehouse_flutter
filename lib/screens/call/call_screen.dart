import 'package:dogehouse_flutter/provider/doge_provider.dart';
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
    return Consumer<DogeProvider>(builder: (context, model, _) {
      return Scaffold(body:  model.currRoom != null && model.currentRoom != null ?Center(
        child: Column(
        children: [
          Text(model.currRoom.toString()),
          Text(model.currentRoom.toString())
        ],
    ),
      ): Center(child: CircularProgressIndicator(),));});
  }
}
