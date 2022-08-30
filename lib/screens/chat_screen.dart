import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kurakani"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => FirebaseFirestore.instance
            .collection("chats/HHnrKgfh4ByFB595NrLy/messages")
            .add(
          {'text': "Added message manually"},
        ),
        child: const Icon(Icons.message),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/HHnrKgfh4ByFB595NrLy/messages')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasError) {
            return Text(streamSnapshot.error.toString());
          }
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = streamSnapshot.requireData;
          return ListView.builder(
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              return Text(data.docs[index]["text"]);
            },
          );
        },
      ),
    );
  }
}
