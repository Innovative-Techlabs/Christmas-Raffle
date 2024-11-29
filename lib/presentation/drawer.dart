import 'package:flutter/material.dart';
import 'package:skidata/presentation/drawer_tile.dart';
import 'package:skidata/presentation/login.dart';
import 'package:skidata/presentation/raffle/raffle_info_screen.dart';
import 'package:skidata/presentation/terms_screen.dart';
import 'package:skidata/services/prefs.dart';
import 'package:skidata/utils/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      backgroundColor: kBackgroundGrey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/cr_logo.png',
            height: 100,
          ),
          // DrawerTile(
          //   label: 'Pay Parking',
          //   onPressed: () {
          //     Navigator.of(context).pushAndRemoveUntil(
          //       MaterialPageRoute(builder: (context) => const SubmitTicket()),
          //       (Route<dynamic> route) => false,
          //     );
          //   },
          // ),
          DrawerTile(
            label: 'Christmas Raffle',
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const RaffleInfoScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          // DrawerTile(
          //   label: 'Transaction History',
          //   onPressed: () {
          //     ConiqAccountService()
          //         .getUserTransactions(AppPreferences.getStoredToken()!);
          //     Navigator.pushNamed(context, TransactionsScreen.routeName);
          //   },
          // ),
          DrawerTile(
            label: 'Terms and Conditions',
            onPressed: () {
              Navigator.pushNamed(context, TermsScreen.routeName);
            },
          ),
          DrawerTile(
              onPressed: () async {
                await AppPreferences.clearPrefs().then(
                  (_) {
                    if (context.mounted) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  },
                );
              },
              icon: Icons.logout,
              label: 'Log Out'),
        ],
      ),
    );
  }
}
