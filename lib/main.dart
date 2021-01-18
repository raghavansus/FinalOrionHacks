import 'package:flutter/material.dart';

import 'Eyes.dart';
import 'GeneralHealth.dart';
import 'NearbyDoc.dart';
import 'Skin.dart';

void main() {
  runApp(mainScreen());
}

// ignore: camel_case_types
class mainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        "Skin": (BuildContext context) => new Skin(),
        "Eyes": (BuildContext context) => new Eyes(),
        "GeneralHealth": (BuildContext context) => new GeneralHealth(),
        "Doctors Nearby": (BuildContext context) => new NearbyDoc(),
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
                'Your Profile',
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
          ],
        ),
      ),
      //backgroundColor: Color(0xFF083663), // not needed now ig
      body: Container(

        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 600,
                    margin: EdgeInsets.only(top: 200),
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
                                  color: Colors.white,
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
  List<String> Categories = [
    "Skin",
    "Eyes",
    "GeneralHealth",
    "Doctors Nearby"
  ];

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
  };

  Widget getCategoryContainer(String categoryName) {
    return new Container(
      // gradient: LinearGradient(colors: [Colors.orange, Colors.blue]),
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 180,
      width: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.blueGrey[900],
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(categoryName),
          Container(
            padding: EdgeInsets.only(top: 30),
            height: 100,
            width: 70,
            child: new FloatingActionButton(
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
        jobCategoriesCards.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getCategoryContainer(category));
        i++;
      }
    }
    if (rows.length > 0) {
      jobCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return jobCategoriesCards;
  }
}
