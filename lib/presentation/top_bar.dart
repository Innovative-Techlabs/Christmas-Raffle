import 'package:flutter/material.dart';
import 'package:skidata/utils/constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      color: kprimaryColor,
      child: Row(
        children: [
          const Text(
            'Circle Rewards',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          Builder(builder: (context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
