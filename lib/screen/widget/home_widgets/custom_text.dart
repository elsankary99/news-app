import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomText({
    super.key,
    this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 24, color: Theme.of(context).hintColor),
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                "View all",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ))
        ],
      ),
    );
  }
}
