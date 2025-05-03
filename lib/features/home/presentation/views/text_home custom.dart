import 'package:flutter/material.dart';

class text extends StatelessWidget {
  String headtext;
  text({required this.headtext});
  @override

  Widget build(BuildContext context) {

    // TODO: implement build
    return Text(
      headtext,
      style: TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.bold,
        color: Color(0xFF392626),
      ),
    );

  }
}