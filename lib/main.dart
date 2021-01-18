import 'package:eye_detector/screens/chat_screen.dart';
import 'package:eye_detector/screens/registration_screen.dart';
import 'package:eye_detector/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'Eyes.dart';
import 'GeneralHealth.dart';
import 'NearbyDoc.dart';
import 'Skin.dart';
import 'chatBot.dart';

void main() {
  runApp(mainScreen());
}

// ignore: camel_case_types
class mainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: WelcomeScreen(),
      routes: <String, WidgetBuilder>{
        "Skin": (BuildContext context) => new Skin(),
        "Eyes": (BuildContext context) => new Eyes(),
        "GeneralHealth": (BuildContext context) => new GeneralHealth(),
        "Doctors Nearby": (BuildContext context) => new NearbyDoc(),
        "Chat Bot": (BuildContext context) => new ChatScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new homescreen();
}

// ignore: camel_case_types
class homescreen extends State<StatefulWidget> {
  int x = 30;

  @override
  Widget build(BuildContext context) {
//    FirebaseUser user = _auth.currentUser() as FirebaseUser;
//      print(user1.displayName);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Welcome to EyeDoctor!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.remove_red_eye),
              title: Text('Eyes'),
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Eyes()))
              },
            ),
            ListTile(
              leading: Icon(Icons.accessibility),
              title: Text('Skin'),
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Skin()))
              },
            ),
            ListTile(
              leading: Icon(Icons.healing),
              title: Text('General Health'),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GeneralHealth()))
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('Doctors Nearby'),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NearbyDoc()))
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('Chat Bot'),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => chatBot()))
              },
            ),
          ],
        ),
      ),
      //backgroundColor: Color(0xFF083663), // not needed now ig
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 2,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                padding: const EdgeInsets.only(
                    top: 70, left: 40, right: 40, bottom: 0),


                    child: Container(
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: Image(
                            height: 80,
                            image: AssetImage('assets/default[1].jpg'),
                          ),
                        ),
                      ),
                    ),

              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 700,
                    //margin: EdgeInsets.only(top: 200),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(0)),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              "Stay Healthy!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 3,
                                  color: Color(0xFF083663),
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          height: 450,
                          child: ListView(
                            children: getJobCategories(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  List<String> Categories = ["Skin", "Eyes", "GeneralHealth", "Doctors Nearby", "Chat Bot"];

  Map jobIcon = {
    "Eyes": Icon(Icons.remove_red_eye, color: Color(0xFF083663), size: 50),
    "Skin": Icon(
      Icons.accessibility,
      color: Color(0xFF083663),
      size: 50,
    ),
    "GeneralHealth": Icon(Icons.healing, color: Color(0xFF083663), size: 50),
    "Doctors Nearby":
        Icon(Icons.local_hospital, color: Color(0xFF083663), size: 50),
    "Chat Bot":
    Icon(Icons.message_rounded, color: Color(0xFF083663), size: 50),
  };

  Widget getCategoryContainer(String categoryName) {
    return Container(
      // gradient: LinearGradient(colors: [Colors.orange, Colors.blue]),
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 180,
      width: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey[900],
            blurRadius: 10.0,
          ),
        ],
        gradient:
            LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                // 0xFFF57C00
                colors: [Colors.blue, const Color(0xFFF57C00)]),
      ),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.all(Radius.circular(15)),
      //   boxShadow: [
      //     new BoxShadow(
      //       color: Colors.blueGrey[900],
      //       blurRadius: 10.0,
      //     ),
      //   ],
      // ),
      child: Column(
        children: <Widget>[
          Text(categoryName),
          Container(
            padding: EdgeInsets.only(top: 30),
            height: 100,
            width: 70,
            child:  FloatingActionButton(
              heroTag: categoryName,
              backgroundColor: Colors.white,
              child: jobIcon[categoryName],
              elevation: 10,
              onPressed: () {
                Navigator.of(context).pushNamed(categoryName);
              },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getJobCategories() {
    List<Widget> jobCategoriesCards = [];
    List<Widget> rows = [];
    int i = 0;
    for (String category in Categories) {
      if (i < 2) {
        rows.add(getCategoryContainer(category));
        i++;
      } else {
        i = 0;
        jobCategoriesCards.add( Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getCategoryContainer(category));
        i++;
      }
    }
    if (rows.length > 0) {
      jobCategoriesCards.add( Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return jobCategoriesCards;
  }
}
