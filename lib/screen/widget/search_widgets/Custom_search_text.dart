import 'package:flutter/material.dart';

class CustomSearchText extends StatelessWidget {
  const CustomSearchText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Discover",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 42,
              color: Theme.of(context).hintColor),
        ),
        const Text(
          "News from all around the world",
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }
}
