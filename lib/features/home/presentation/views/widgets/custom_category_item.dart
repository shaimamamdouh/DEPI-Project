import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(text),
        backgroundColor: ColorsData.bottomsColor,
        labelStyle: TextStyle(color: ColorsData.secondaryColor),
      ),
    );
  }
}
