import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  const DrawerTile({
    super.key,
    this.icon,
    required this.onPressed,
    required this.label,
  });

  final div = const Divider(
    color: Colors.black,
    thickness: 0.1,
    height: 1,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: icon != null ? Colors.red : Colors.black),
                ),
                const Spacer(),
                Icon(
                  icon ?? Icons.arrow_forward_ios,
                  color: icon != null ? Colors.red : Colors.black,
                  size: 14,
                )
              ],
            ),
          ),
        ),
        div,
      ],
    );
  }
}
