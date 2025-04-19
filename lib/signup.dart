import 'package:flutter/material.dart';
class SignUp extends StatelessWidget{
  const SignUp({super.key});

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
                  "Create Your Acount! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF392626),
                  )),
          const SizedBox(height: 75),
        TextField(
          decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 25),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          ),
        ),
              SizedBox(height:25),
              TextField(
                decoration: InputDecoration(
                  labelText: "phone",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
               SizedBox(
                 height: 100,
               ),
               ElevatedButton(
                         onPressed: () {},
                        style: ElevatedButton.styleFrom(
                         backgroundColor: const Color(0xFF392626),
                        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                           shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                           elevation: 10,
                              ),
                             child: const Text(
                             "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                             )),
               )],
        )))));

  }

}