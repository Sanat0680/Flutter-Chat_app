import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        elevation: 0,
        title: Center(
          child: Text(
            'Homepage',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.2,
            //color: Colors.amber,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: size.height * 0.2 - 30,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 15), color: Colors.green[200])
                    ],
                    color: Colors.green[600],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome to MyChat..!!',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  // padding: EdgeInsets.only(
                  //left: 20,
                  // right: 20,
                  //),
                  height: size.height * 0.4 - 180,
                  width: size.height * 0.3,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 15), color: Colors.red[200])
                    ],
                    color: Colors.red[800],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 15,
                        //bottom: 0,
                        left: 20,
                        right: 20,
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            //border:
                            //  Border.all(width: 5, color: Colors.blue[700]),

                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Already a user..??',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 50,
                        right: 50,
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 5, color: Colors.red[900]),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Material(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                              elevation: 20,
                              child: MaterialButton(
                                  child: Text('Login'),
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/login");
                                  })),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: size.height * 0.4 - 180,
                  width: size.height * 0.3,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 15), color: Colors.blue[200])
                    ],
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 15,
                        //bottom: 0,
                        left: 20,
                        right: 20,
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.blue[200],
                            //border:
                            //  Border.all(width: 5, color: Colors.blue[700]),

                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            'Not yet Registered..??',
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                    ),
                          )),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 50,
                        right: 50,
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 5, color: Colors.blue[700]),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Material(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                              elevation: 20,
                              child: MaterialButton(
                                  child: Text('Register'),
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/reg");
                                  })),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
