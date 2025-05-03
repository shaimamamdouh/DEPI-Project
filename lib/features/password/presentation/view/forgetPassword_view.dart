import 'package:flutter/material.dart';
import 'package:readio/features/password/presentation/view/sendCode_view.dart';
class ForgotPassWord extends StatelessWidget{
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
                              "Forgot Password? ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF392626),
                              )),
                          SizedBox(height: 10),
                          Text("Forgot your password?\n No problem. Just let us know your email address and we will send you a code to renew your password."),
                          SizedBox(height: 50),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email),
                            ),

                          ),
                          SizedBox(height: 100),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder:(context){
                                return SendCode();
                              }));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF392626),
                              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 10,
                            ),
                            child: const Text(
                                "Send Code",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ]))))


    );
  }
}