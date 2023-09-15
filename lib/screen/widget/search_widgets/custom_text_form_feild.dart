import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/core/constant/app_color.dart';

class CustomTextFormFelid extends StatelessWidget {
  const CustomTextFormFelid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColor.lightGrey),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "  Search",
          suffixIcon: Icon(
            FontAwesomeIcons.sliders,
            size: 20,
          ),
          prefixIcon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 20,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
