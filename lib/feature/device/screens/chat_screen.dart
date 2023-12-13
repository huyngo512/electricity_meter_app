import 'package:electricity_meter_app/general/models/message_model.dart';
import 'package:electricity_meter_app/general/utils/utils.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController textEditingController;
  late ScrollController scrollController;
  List<MessageModel> messages = [];

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 350),
        curve: Curves.ease,
      );
    });
  }

  void chat(String msg) {
    setState(() {
      messages.add(MessageModel(msg, DateTime.now()));
      scrollToBottom();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 70,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [...messages].map((item) {
                    return Container(
                      margin: const EdgeInsets.only(
                        //if is my message, then it has margin 40 at left
                        left: 40,
                        right: 0, //else margin at right
                      ),
                      child: Card(
                        color: Colors.blue[100],
                        //if its my message then, blue background else red background
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'hngo512',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  item.msg,
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  Utils.getTimeStopwatch(item.time),
                                  style: const TextStyle(fontSize: 17),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Positioned(
            //position text field at bottom of screen

            bottom: 0, left: 0, right: 0,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.1),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: textEditingController,
                      decoration:
                          const InputDecoration(hintText: "Enter your Message"),
                    ),
                  )),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (textEditingController.text.isNotEmpty) {
                          chat(textEditingController.text);
                        }
                      },
                      child: const Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
