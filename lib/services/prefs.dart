import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _preferences;
  static String tokenKey = 'userToken';
  static String ticketKey = 'ticketID';
  static String emailKey = 'emailID';

  static initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future clearPrefs() async {
    await _preferences!.clear();
  }

  static Future setToken(String? newToken) async {
    _preferences!.setString(tokenKey, newToken!);
  }

  static Future setEmail(String email) async {
    _preferences!.setString(emailKey, email);
  }

  static Future setTicketAmount(int amount) async {
    _preferences!.setInt(ticketKey, amount);
  }

  static String getStoredToken() => _preferences?.getString(tokenKey) ?? '';
  static String? getEmailString() => _preferences?.getString(emailKey);

  static int? getStoredTicketAmount() => _preferences?.getInt(ticketKey);
}
