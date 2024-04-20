import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger_app/chat/chat_feature.dart';
import 'package:messenger_app/utils/message_container.dart';

class ChatPage extends StatefulWidget {
  final String receiverId;

  /*final String receiverEmail;
  final String receiverName;*/
  final Map<String, dynamic> data;

  const ChatPage({super.key, required this.data, required this.receiverId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatFeature _chatFeature = ChatFeature();
  var focusNode = FocusNode();
  //final _firebase = FirebaseAuth.instance;

  void sendMessage() async {
    try {
      if (_messageController.text.isNotEmpty) {
        await _chatFeature.sendMessage(
            widget.receiverId, _messageController.text.trim());
        _messageController.clear();
      }
    } catch (e) {
      //
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(158, 126, 253, 1),
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        leadingWidth: 30,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/cuteboy.png'),
              radius: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.data['name'],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text("online", style: TextStyle(fontSize: 10))
              ],
            )
          ],
        ),
        actions: const [
          Icon(Icons.call),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.video_call_rounded),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.more_vert),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.86,
              child: Expanded(
                child: _buildMessageList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
// <<<<<<< HEAD
                  // /*const SizedBox(
                  //   width: 40,
                  // ),*/
                  // /*  child: RawKeyboardListener(
                  //     focusNode: FocusNode(),
                  //     onKey: (RawKeyEvent event) {
                  //       if (event is RawKeyDownEvent &&
                  //           event.logicalKey == LogicalKeyboardKey.enter) {
                  //         sendMessage();
                  //       }
                  //     },*/
                  //
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(right: 20),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //             color: const Color.fromRGBO(158, 126, 253, 0.3),
                  //             style: BorderStyle.solid,
                  //             width: 1),
                  //         borderRadius: BorderRadius.circular(360),
                  //         color: Colors.grey[200],
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 30,
                  //         ),
                  //         child: TextField(
                  //           controller: _messageController,
                  //           decoration: const InputDecoration(
                  //             border: InputBorder.none,
                  //             hintText: 'Type Message here..',
                  //             hintStyle: TextStyle(
                  //               fontSize: 12,
                  //             ),
                  //           ),
                  //           onSubmitted: (value) {
                  //             sendMessage();
                  //           },
                  //           textInputAction: TextInputAction.done,
                  //         ),
// =======
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360),
                          color: Colors.grey[200],
                          border: Border.all(
                              color: const Color.fromRGBO(158, 126, 253, 0.3),
                              style: BorderStyle.solid)),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.064,
                      // color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Icon(
                                Icons.emoji_emotions,
                                color: Color.fromRGBO(158, 126, 253, 1),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Expanded(
                                child: TextField(
                                  controller: _messageController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter message here...",
                                      hintStyle: TextStyle(fontSize: 13)),
                                  onSubmitted: (value) {
                                    sendMessage();
                                  },
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ),
                          ],
// >>>>>>> chat_ui
                        ),
                      ),
                    ),
                  ),
// <<<<<<< HEAD
//
//                   /* const SizedBox(
//                     width: 40,
//                   ),*/
// =======
// >>>>>>> chat_ui
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360),
                          color: CupertinoColors.systemPurple),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatFeature.getMessage(
            widget.receiverId, FirebaseAuth.instance.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs
                  .map((document) => _buildMessageItem(document))
                  .toList(),
            );
          }
          return const Text('Got some error');
        });
  }

  Widget _buildMessageItem(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    var alignment = (data['SenderId'] == FirebaseAuth.instance.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    Timestamp timestamp = data['Timestamp'];
    DateTime dateTime = timestamp.toDate();
    String formattedTime = DateFormat.jm().format(dateTime);

    return Container(
        padding: const EdgeInsets.all(8),
        alignment: alignment,
        child: MessageContainer(
          message: data['Message'],
          time: formattedTime,
          foreColor:
              (data['SenderId'] == FirebaseAuth.instance.currentUser!.uid)
                  ? Colors.grey.shade800
                  : Colors.white,
          bgColor: (data['SenderId'] == FirebaseAuth.instance.currentUser!.uid)
              ? const Color.fromRGBO(10, 202, 230, 0.3)
              : const Color.fromRGBO(74, 210, 153, 1),
        ));
  }
}
