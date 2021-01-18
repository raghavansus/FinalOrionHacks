import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chatBot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: chatbot(),
    );
    // TODO: implement build
  }
}
//change

class chatbot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ChattsBot();
}

class ChattsBot extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(

      ),
    );
  }

}
