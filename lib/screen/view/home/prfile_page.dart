import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/extension/media_query.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Image.asset(
          "assets/images/news.png",
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(height: context.height * 0.30),
        Center(
          child: SizedBox(
            width: context.width * 0.8,
            child: const Row(
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
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "App Version : 1.0.0",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColor.grey, fontSize: 16),
        ),
      ]),
    );
  }
}
