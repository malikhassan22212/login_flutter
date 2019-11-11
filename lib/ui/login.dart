import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
    // TODO: implement createState
  }
}

class LoginState extends State<Login> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";

  void _erase() {
    setState(() {
      _usernameController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome() {
    setState(() {
      if (_usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _welcomeString = _usernameController.text;
        print(_welcomeString);
      } else {
        _welcomeString = "Nothing";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login flutter"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.green,
      body: new Container(
        alignment: Alignment.bottomCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
            ),
            new Container(
              height: 280.0,
              width: double.maxFinite,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _usernameController,
                    decoration: new InputDecoration(
                        hintText: 'Username', icon: new Icon(Icons.person)),
                  ),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                        hintText: 'Password', icon: new Icon(Icons.lock)),
                    obscureText: true,
                  ),

                  new Padding(padding: EdgeInsets.all(10.5)), //add padding

                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left: 38),
                          child: new RaisedButton(
                            onPressed: _showWelcome,
                            color: Colors.red,
                            child: new Text(
                              "Login",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16.9),
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 38),
                          child: new RaisedButton(
                            onPressed: _erase,
                            color: Colors.blue,
                            child: new Text(
                              "Clear",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16.9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ), //form ends here

            new Padding(padding: const EdgeInsets.all(14.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Welcome $_welcomeString',
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w800),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
