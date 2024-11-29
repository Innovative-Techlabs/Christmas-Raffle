import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skidata/utils/constants.dart';

class PrimaryElevatedBtn extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback? onPressed;

  const PrimaryElevatedBtn({
    super.key,
    required this.label,
    this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: kprimaryColor.withAlpha(200),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        backgroundColor: kprimaryColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: isActive
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : Text(label),
          ),
        ],
      ),
    );
  }
}
