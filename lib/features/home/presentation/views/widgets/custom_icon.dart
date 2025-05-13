import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';

class CustomIconButtom extends StatelessWidget {
  const CustomIconButtom({
    super.key,
    required this.icon,
    required this.onTap,
    this.isLoading = false,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: ColorsData.secondaryColor,
          shape: BoxShape.circle,
          //  border: Border.all(),
        ),
        child: Center(
          child: Icon(icon, size: 25, color: ColorsData.bottomsColor),
        ),
      ),
    );
  }
}
