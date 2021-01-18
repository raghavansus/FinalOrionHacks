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
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft, end: Alignment.bottomRight,
              // 0xFFF57C00 <- darker orange used for the icon ones
              // Colors.blue <- darker blue used for the icon ones
              //FF90CAF9 <- light blue
              //FFFFCC80 <- light orange
              colors: [const Color(0xFF90CAF9), const Color(0xFFFFCC80)]),
        ),
      ),
    );
  }

}
