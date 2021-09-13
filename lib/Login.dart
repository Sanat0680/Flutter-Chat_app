import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var auth = FirebaseAuth.instance;
  String email;
  String password;
  bool spin = false;
  var user;
  var username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spin,
        child: Container(
          color: Colors.black12,
          child: Center(
            child: Container(
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: " Email/UserID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                    elevation: 5,
                    child: MaterialButton(
                      child: Text('       LOGIN       '),
                      onPressed: () async {
                        setState(() {
                          spin = true;
                        });
                        try {
                          user = await auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != Null) {
                            Navigator.pushNamed(context, "/chat");
                            setState(() {
                              spin = false;
                            });
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text('Not an user?'),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 25,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.red[100],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: MaterialButton(
                              child: Text('Register...!'),
                              onPressed: () {
                                Navigator.pushNamed(context, "/reg");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
