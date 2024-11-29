import 'package:flutter/material.dart';
import 'package:skidata/utils/responsive.dart';

class CustomCard extends StatelessWidget {
  final List<Widget> children;
  final bool? hasMinHeight;
  final bool hasBorder;

  final EdgeInsetsGeometry? padding;
  const CustomCard({
    super.key,
    required this.children,
    this.hasMinHeight,
    this.hasBorder = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (
      context,
      constraints,
    ) {
      return Container(
        width: Responsive.width(constraints.maxWidth),
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30,
            ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: hasBorder
                ? Border.all(
                    color: const Color(0xffdfe0eb),
                  )
                : null),
        child: Column(
          mainAxisSize:
              hasMinHeight != null ? MainAxisSize.min : MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      );
    });
  }
}
