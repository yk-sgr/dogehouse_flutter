import 'package:dogehouse_flutter/components/input_field.dart';
import 'package:dogehouse_flutter/items/chat_item.dart';
import 'package:dogehouse_flutter/provider/doge_provider.dart';
import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CallChat extends StatefulWidget {
  @override
  _CallChatState createState() => _CallChatState();
}

class _CallChatState extends State<CallChat> {
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  sendMessage(String message) async {
    if (message != "") {
      setState(() {
        Provider.of<DogeProvider>(context, listen: false).sendMessage(message);
      });
      setState(() {
        textEditingController.clear();
      });
      await Future.delayed(Duration(milliseconds: 250));
      setState(() {
        listScrollController.animateTo(listScrollController.position.maxScrollExtent, curve: Curves.easeIn, duration: Duration(milliseconds: 250));
      });
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DogeProvider>(builder: (context, model, _) {
      return Container(
        color: Palette.backgroundColor,
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
              controller: listScrollController,
              padding: EdgeInsets.all(8.0),
              itemBuilder: (context, index) => ChatItem(model.currMessages[index]),
              itemCount: model.currMessages.length,
            )),
            InputField(textEditingController, focusNode, sendMessage),
          ],
        ),
      );
    });
  }
}
