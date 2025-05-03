import 'package:flutter/material.dart';
class RenewPassword extends StatelessWidget{
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
                      children: <Widget>[
                        const Text(
                            "New Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF392626),
                            )),
                        SizedBox(height: 80),
                        TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "New Password",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                            )),
                        SizedBox(height: 30),
                        TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: " Confirm New Password",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                            )),
                        SizedBox(height: 100),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(30, 10),
                            backgroundColor: const Color(0xFF392626),
                            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 10,
                          ),
                          child:Center(
                              child: const Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,

                                  ))),
                        )
                      ],)))));
  }
}