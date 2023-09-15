import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/core/constant/app_color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(FontAwesomeIcons.facebook,
                size: 40, color: AppColor.primaryColor),
            Icon(FontAwesomeIcons.telegram,
                size: 40, color: AppColor.primaryColor),
            Icon(FontAwesomeIcons.youtube, size: 40, color: Colors.red),
            Icon(FontAwesomeIcons.whatsapp, size: 40, color: Colors.green),
            Icon(FontAwesomeIcons.linkedin,
                size: 40, color: AppColor.primaryColor),
          ],
        )
      ]),
    );
  }
}
