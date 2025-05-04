import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/home/presentation/views/widgets/custom_icon.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/profile.jpg'),
          radius: 35,
        ),
      ),
      title: Image(image: AssetImage(AssetsData.logoLight2), height: 60),
      centerTitle: true,

      actions: [
        CustomIconButtom(icon: Icons.notifications, onTap: () {}),
        const SizedBox(width: 5),
        CustomIconButtom(icon: Icons.settings, onTap: () {}),
        const SizedBox(width: 16),
      ],
    );
  }
}
