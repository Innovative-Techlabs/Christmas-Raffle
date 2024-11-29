import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skidata/presentation/login.dart';
import 'package:skidata/presentation/parking/payment_confirmation_screen.dart';
import 'package:skidata/presentation/parking/payment_screen.dart';
import 'package:skidata/presentation/parking/submit_ticket_screen.dart';
import 'package:skidata/presentation/raffle/raffle_info_screen.dart';
import 'package:skidata/presentation/terms_screen.dart';
import 'package:skidata/services/prefs.dart';
import 'package:skidata/nav_provider.dart';
import 'package:skidata/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.initPrefs();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: kprimaryColor,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      // home: const RaffleInfoScreen(),
      // home: const SpinWheelScreen(),
      routes: {
        SubmitTicket.routeName: (ctx) => const SubmitTicket(),
        PaymentScreen.routeName: (ctx) => const PaymentScreen(),
        PaymentConfirmationScreen.routeName: (ctx) =>
            const PaymentConfirmationScreen(),
        TermsScreen.routeName: (ctx) => const TermsScreen(),
        RaffleInfoScreen.routeName: (context) => const RaffleInfoScreen(),
      },
    );
  }
}
