import 'package:flutter/material.dart';
import 'package:skidata/models/user.dart';
import 'package:skidata/presentation/app_card.dart';
import 'package:skidata/presentation/drawer.dart';
import 'package:skidata/presentation/parking/payment_screen.dart';
import 'package:skidata/presentation/primaryelevatedbtn.dart';
import 'package:skidata/presentation/top_bar.dart';
import 'package:skidata/services/coniq_account_service.dart';
import 'package:skidata/services/prefs.dart';
import 'package:skidata/utils/constants.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  static const routeName = 'pay';
  const PaymentConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundGrey,
      drawer: const AppDrawer(),
      body: Center(
        child: FutureBuilder<User?>(
            future:
                ConiqAccountService().getUser(AppPreferences.getStoredToken()!),
            builder: (context, snapshot) {
              Widget? child;
              if (snapshot.connectionState == ConnectionState.waiting) {
                child = const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                User user = snapshot.data!;
                child = Column(
                  children: [
                    const TopBar(),
                    kSBox30V,
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
                    const PaymentSuccessful()
                  ],
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

class PaymentFailure extends StatelessWidget {
  const PaymentFailure({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      children: [
        Text(
          'Your payment did not go\n through',
          style: mediumGreyText.copyWith(
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
        kSBox30V,
        const Text(
          'Please try again or use an alternate payment\n option',
          style: smallGreyText,
          textAlign: TextAlign.center,
        ),
        kSBox10V,
        PrimaryElevatedBtn(
          label: 'Try Again',
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(PaymentScreen.routeName);
          },
        ),
      ],
    );
  }
}

class PaymentSuccessful extends StatelessWidget {
  const PaymentSuccessful({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      children: [
        Text(
          'Your payment was \n successful',
          style: mediumGreyText.copyWith(
            color: Colors.green,
          ),
          textAlign: TextAlign.center,
        ),
        kSBox20V,
        const Text(
          'You have 10 minutes to exit the premises',
          style: smallGreyText,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
