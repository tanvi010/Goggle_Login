import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sample/GoogleLogin.dart';

class ListOfUsers extends StatefulWidget {
  @override
  _ListOfUsersState createState() => _ListOfUsersState();
}

class _ListOfUsersState extends State<ListOfUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Users"),
      ),
      body: StreamBuilder(
        stream: databaseRef.child("UserData").onValue,
        builder: (context, snap){

          Map<dynamic, dynamic> data = snap.data.snapshot.value;
          List<dynamic> userKey = data.keys.toList();
          List<dynamic> userData = data.values.toList();
          List<dynamic> username  = [];
          List<dynamic> useremail = [];
          List<dynamic> userProfile = [];
          userData.forEach((element) {
            username.add(element['Username']);
            useremail.add(element['Useremail']);
            userProfile.add(element['UserProfile']);
          });

          print(username);
          print(useremail);
          print(userProfile);

          return ListView.builder(
            itemCount: userData.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.lightBlue[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.network(userProfile[index].toString()),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Text(username[index].toString()),
                            Text(useremail[index].toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
