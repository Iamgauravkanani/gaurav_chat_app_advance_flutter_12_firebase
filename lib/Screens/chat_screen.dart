import 'package:chat_app_af_12/Components/Helpers/firebase_cloud_firestore_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../Components/Globals/globals.dart';

class Chat_Screen extends StatefulWidget {
  const Chat_Screen({super.key});

  @override
  State<Chat_Screen> createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  TextEditingController message_controller = TextEditingController();
  // late Stream<QuerySnapshot<Map<String, dynamic>>> allMessages;
  // @override
  // void initState() {
  //   super.initState();
  //   allMessages = FireStore_Helper.fireStore_Helper
  //       .DisplayMessage(uid1: Global.u1, uid2: Global.u2);
  // }

  @override
  Widget build(BuildContext context) {
    List<String> data =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 10,
              child: StreamBuilder(
                stream: all_stream_messages,
                builder: (ctx, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    QuerySnapshot<Map<String, dynamic>>? snapshot_data =
                        snapshot.data;
                    List<QueryDocumentSnapshot<Map<String, dynamic>>>? data =
                        snapshot_data?.docs;

                    return ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Chip(label: Text("${data[index]['msg']}"));
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )),
          SearchBarAnimation(
            hintText: "send message....",
            buttonWidget: Icon(Icons.send),
            textEditingController: message_controller,
            isOriginalAnimation: true,
            trailingWidget: GestureDetector(
                onTap: () {
                  FireStore_Helper.fireStore_Helper.sendMessage(
                    uid1: data[0],
                    uid2: data[1],
                    msg: message_controller.text,
                  );

                  message_controller.clear();
                },
                child: Icon(Icons.send)),
            secondaryButtonWidget: Icon(Icons.close),
          )
        ],
      ),
    );
  }
}