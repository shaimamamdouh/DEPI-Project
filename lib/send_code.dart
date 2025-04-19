import 'package:flutter/material.dart';
import 'package:project_flutter/renew_password.dart';
class SendCode extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFEF6E3),
        appBar: AppBar(
            title: const Text(""),
            backgroundColor: const Color(0xFFFEF6E3)),
        body:Center(
        child:SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(24.0),
    child: Column(
    children:<Widget>[
    const Text(
    "Enter the code sent ",
    textAlign: TextAlign.left,
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Color(0xFF392626)
    )),
      SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.code),
              )),
      SizedBox(height: 80),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return RenewPassword();
          }));
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(30, 10),
          backgroundColor: const Color(0xFF392626),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
        ),
        child: const Text(
            "New Password",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
      )
    ],)))));
  }

}