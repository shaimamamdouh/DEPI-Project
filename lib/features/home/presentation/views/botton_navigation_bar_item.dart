 import 'package:flutter/material.dart';
 class CustomBottom {

   final String labelText;
   final Widget icon;
   CustomBottom({required this.labelText, required this.icon});
   BottomNavigationBarItem get item => BottomNavigationBarItem(
     backgroundColor: Colors.transparent,
     icon: icon,
     label: labelText,
   );
 }
