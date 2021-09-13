//import 'package:chatapp/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/animation.dart';

//import 'package:group_chat_app/messages/chat_bubble.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var auth = FirebaseAuth.instance;
  var user;
  var msgdoc;
  //final _auth = FirebaseAuth.instance;
  final fs = FirebaseFirestore.instance;
  final controller = new TextEditingController();

  String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF434E),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
          ),
          onTap: () {
            /* go back */
            Navigator.popAndPushNamed(context, "/");
          },
        ),
        title: Text(
          "Chat Window",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          DropdownButton(
            dropdownColor: Color(0xffFF434E),
            underline: Container(),
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                value: 'Logout',
              ),
            ],
            onChanged: (menuItem) {
              if (menuItem == "Logout") {
                /* signout */
                auth.signOut();
                Navigator.popAndPushNamed(context, "/");
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: MessageStream(),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Set your Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      controller: controller,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        /* when user types */
                        message = value;
                        print(message);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  FlatButton(
                    onPressed: () async {
                      controller.clear();
                      FocusScope.of(context).unfocus();
                      /* when user hits send, adds texts */
                      msgdoc = await fs.collection('chat').get();
                      print(msgdoc.docs);
                      //print(msgdoc.docs);
                      await fs.collection('chat').add({
                        'senderName': auth.currentUser.displayName,
                        'text': message,
                        'time': DateTime.now(),
                        'senderEmail': auth.currentUser.email,
                      });
                    },
                    child: Icon(
                      Icons.send,
                      color: Color(0xffFF434E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  ChatBubble(this.isMe, this.message);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      width: MediaQuery.of(context).size.width,
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 13),
        decoration: BoxDecoration(
            color: isMe ? Colors.blue[500] : Colors.red[800],
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(23),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomRight: Radius.circular(23),
                  )),
        child: Text(
          message,
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontSize: 13,
                color: isMe ? Colors.black : Colors.white,
              ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MessageStream extends StatelessWidget {
  final fs = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: StreamBuilder(
        stream: fs.collection('chat').orderBy('time').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final messageStream = snapshot.data.documents;
          return ListView.builder(
            itemCount: messageStream.length,
            itemBuilder: (context, itemIndex) {
              return ChatBubble(
                (messageStream[itemIndex]['senderEmail'] ==
                    auth.currentUser.email),
                messageStream[itemIndex]['text'],
              );
            },
          );
        },
      ),
    );
  }
}
