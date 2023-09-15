import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_color.dart';

class DrawerCard extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData icon;
  const DrawerCard({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        title: Text(title),
        trailing: Icon(
          icon,
          color: AppColor.primaryColor,
        ),
        onTap: onTap,
      ),
    );
  }
}
