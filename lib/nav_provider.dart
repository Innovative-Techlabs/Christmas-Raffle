import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skidata/presentation/parking/payment_confirmation_screen.dart';
import 'package:skidata/presentation/parking/payment_screen.dart';
import 'package:skidata/presentation/raffle/raffle_info_screen.dart';
import 'package:skidata/services/coniq_account_service.dart';
import 'package:skidata/services/prefs.dart';
import 'package:skidata/utils/constants.dart';

class NavProvider with ChangeNotifier {
  bool _signInValid = false;
  bool get signInValid => _signInValid;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool _isSigningIn = false;
  bool get isSigningIn => _isSigningIn;
  bool _obscurePasswd = true;
  bool get obscurePasswd => _obscurePasswd;

  void setSignIn(
    String? email,
    String? password,
  ) {
    _signInValid = email != null &&
        password != null &&
        email.isNotEmpty &&
        password.isNotEmpty;
    notifyListeners();
  }

  void signIn(
    GlobalKey<FormState> formKey,
    BuildContext ctx,
    String email,
    String password,
  ) async {
    await AppPreferences.clearPrefs();
    _errorMessage = '';
    _isSigningIn = true;
    notifyListeners();
    try {
      if (formKey.currentState!.validate()) {
        var response = await ConiqAccountService().signIn(
          email,
          password,
        );

        var body = jsonDecode(await response.stream.bytesToString());
        if (response.statusCode == 200 && ctx.mounted) {
          _signInValid = false;
          var token = body['access_token'];
          AppPreferences.setToken(token);
          Navigator.pushReplacementNamed(
            ctx,
            RaffleInfoScreen.routeName,
          );
        } else if (response.statusCode == 400 && ctx.mounted) {
          String error = body['error_description'];
          _errorMessage = error;
          notifyListeners();
        }
        _isSigningIn = false;
        notifyListeners();
      }
    } catch (e) {
      _isSigningIn = true;
      notifyListeners();

      throw e.toString();
    }
  }

  void togglePasswdVisibility() {
    _obscurePasswd = !obscurePasswd;
    notifyListeners();
  }

  void submitParkingTicketID(
    GlobalKey<FormState> formKey,
    BuildContext ctx,
    String ticketID,
  ) async {
    if (formKey.currentState!.validate()) {
      AppPreferences.setTicketAmount(50);
      Navigator.of(ctx).pushNamed(PaymentScreen.routeName);
    }
  }

  bool _isReedeming = false;
  bool get isreedeming => _isReedeming;

  void redeem(BuildContext ctx) async {
    _isReedeming = true;
    notifyListeners();
    try {
      int amount = AppPreferences.getStoredTicketAmount()!;
      int statusCode = await ConiqAccountService().reedemPoints(amount,
          pointsToRuleMap[amount].toString(), AppPreferences.getStoredToken()!);

      if (statusCode == 201 && ctx.mounted) {
        Navigator.of(ctx).pushNamed(PaymentConfirmationScreen.routeName);
      }
      _isReedeming = false;
      notifyListeners();
    } catch (e) {
      _isReedeming = true;
      notifyListeners();
      throw 'Something went wrong please try again';
    }
  }
}
