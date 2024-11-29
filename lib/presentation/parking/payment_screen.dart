import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skidata/models/user.dart';
import 'package:skidata/nav_provider.dart';
import 'package:skidata/presentation/app_card.dart';
import 'package:skidata/presentation/drawer.dart';
import 'package:skidata/presentation/primaryelevatedbtn.dart';
import 'package:skidata/presentation/top_bar.dart';
import 'package:skidata/services/coniq_account_service.dart';
import 'package:skidata/services/prefs.dart';
import 'package:skidata/utils/constants.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = 'cr';
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: kBackgroundGrey,
      body: Center(
        child: FutureBuilder<User?>(
            future:
                ConiqAccountService().getUser(AppPreferences.getStoredToken()!),
            builder: (context, snapshot) {
              Widget? child;
              if (snapshot.connectionState == ConnectionState.waiting) {
                child = const CircularProgressIndicator(
                  strokeWidth: 1.5,
                );
              } else if (snapshot.hasData) {
                child = UserProfileWidget(
                  user: snapshot.data!,
                );
              } else {
                child = const Text('something went wrong');
              }
              return child;
            }),
      ),
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  final User user;
  const UserProfileWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBar(),
        kSBox30V,
        Text(
          'Hello ${user.firstName}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          'Pay for Parking with Points',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'You have ${user.balance} Points',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: largeGreyText.color,
          ),
        ),
        kSBox20V,
        CustomCard(children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: '${AppPreferences.getStoredTicketAmount()}',
                  style: largeGreyText,
                  children: [
                    TextSpan(
                        text: 'KSH',
                        style: smallGreyText.copyWith(
                          fontSize: 20,
                        ))
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                '=',
                style: largeGreyText,
              ),
              const Spacer(),
              Text(
                '${AppPreferences.getStoredTicketAmount()}',
                style: largeGreyText,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  'Parking Cost',
                  style: smallGreyText,
                ),
                Spacer(),
                Text(
                  'Points',
                  style: smallGreyText,
                )
              ],
            ),
          ),
          kSBox10V,
          Text(
            user.balance >= AppPreferences.getStoredTicketAmount()!
                ? 'You have enough points to pay for parking'
                : 'You do not have enough points to pay for parking',
            style: user.balance >= AppPreferences.getStoredTicketAmount()!
                ? smallGreyText
                : smallRedText,
          ),
          kSBox20V,
          Consumer<NavProvider>(builder: (
            context,
            navProv,
            child,
          ) {
            return PrimaryElevatedBtn(
              isActive: navProv.isreedeming,
              label: 'Pay with points',
              onPressed: user.balance >= AppPreferences.getStoredTicketAmount()!
                  ? () {
                      navProv.redeem(context);
                    }
                  : null,
            );
          }),
        ]),
      ],
    );
  }
}
