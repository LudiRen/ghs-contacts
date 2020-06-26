import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  Widget _contactCards(String t, int phoneNum, int faxNum ){
    return Center(
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("$t"),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(onPressed: ()=>UrlLauncher.launch("tel://${phoneNum.toString()}"), child: Text("CALL: $phoneNum")),
                FlatButton(onPressed: ()=> UrlLauncher.launch("tel://${faxNum.toString()}"), child: Text("FAX: $faxNum")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _ghsContacts() {
    return 
        Card(
          margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              //Below is the thing that seems to be erroring out
              shrinkWrap: true,
              children: <Widget>[
                const ListTile(
                  title:Text("Geneva High School"),
                  subtitle: Text("416 McKinley Ave. Geneva, Illinois 60134"),
                  ),
                  Divider(),
                                  
                
                  _contactCards("Main Office", 6304633800, 6304633809),
                
                  _contactCards("Athletic Office", 6304633811, 6304633819),
              
                  _contactCards("Counseling & Advising", 6304633830, 6304633839),
                ],
              ),
            ),
          
        );
   }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("App"),
      ),
      body: ListView(
        children: <Widget>[
          _ghsContacts(),

        ],
      ), 
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

