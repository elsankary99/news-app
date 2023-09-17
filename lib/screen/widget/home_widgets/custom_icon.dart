import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final Color? color;
  const CustomIcon({
    super.key,
    this.onTap,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(99)),
        child: Icon(
          icon,
          color: color ?? Theme.of(context).hintColor,
          size: 20,
        ),
        // Adjust the opacity and color as desired
      ),
    );
  }
}
