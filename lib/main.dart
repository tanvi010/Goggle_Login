import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sample/GoogleLogin.dart';
import 'package:google_sample/ListOfUsers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {


  @override
  void initState() {
    // TODO: implement initState
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Google Login"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
               signInWithGoogle().then((result) async{
                if(result != null){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfUsers()));
                }
               });
              },
              child: Container(
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Sign in with Google",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                signOut();
              },
              child: Container(
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Sign in with Google",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


