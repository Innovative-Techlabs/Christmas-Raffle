import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skidata/models/customer_data_model.dart';
import 'package:skidata/models/user.dart';
import 'package:skidata/services/prefs.dart';

class ConiqAccountService {
  Future<http.StreamedResponse> signIn(
    String email,
    String password,
  ) async {
    AppPreferences.setEmail(email);
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('https://platform.coniq.com/oauth/v2/token'));
      request.body = json.encode({
        "client_id": "152_2dbn48sqr9hco8848gsko4ggw0gw800sg0koo08k8k88cw8kk0",
        "client_secret": "3w5c4ss6g5yc08ssk44gwc40go4sowso0kk444og40kswkc4w8",
        "grant_type": "password",
        "username": email,
        "password": password
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User?> getUser(
    String token,
  ) async {
    User? user;
    try {
      var headers = {
        'x-api-version': '3.0',
        'Authorization': 'Bearer $token',
      };
      var request = http.MultipartRequest(
          'GET',
          Uri.parse(
              'https://api.coniq.com/app/customer/program/CircleRewards'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        user = userDetailsFromJson(await response.stream.bytesToString());
      }
      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  // Future<Transactions?> getUserTransactions(
  //   String token,
  // ) async {
  //   Transactions? tx;
  //   try {
  //     var headers = {
  //       'x-api-version': '3.0',
  //       'Authorization': 'Bearer $token',
  //       'Cookie': 'PHPSESSID=7eodurur77if2ho2km2kqokja7'
  //     };
  //     var request = http.Request(
  //         'GET', Uri.parse('https://api.coniq.com/app/customer/activity-feed'));

  //     request.headers.addAll(headers);

  //     http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 200) {
  //       tx = transactionsFromJson(await response.stream.bytesToString());

  //       return tx;
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  //   return null;
  // }

  // Future<List<ActivityFeed>> getRaffleEntriesTx(
  //   String token,
  // ) async {
  //   List<ActivityFeed> entries = [];

  //   try {
  //     var headers = {
  //       'x-api-version': '3.0',
  //       'Authorization': 'Bearer $token',
  //       'Cookie': 'PHPSESSID=7eodurur77if2ho2km2kqokja7'
  //     };
  //     var request = http.Request(
  //         'GET', Uri.parse('https://api.coniq.com/app/customer/activity-feed'));

  //     request.headers.addAll(headers);

  //     http.StreamedResponse response = await request.send();

  //     // TODO: Filter for only transactions after Dec 1st
  //     // TODO: Set amount filter from marketing team

  //     if (response.statusCode == 200) {
  //       var tx = transactionsFromJson(await response.stream.bytesToString());
  //       entries = tx.activityFeed
  //           .where((feed) =>
  //               feed.data.price >= 12 &&
  //               feed.data.points.earned > 0 &&
  //               feed.data.refundAmount == 0)
  //           .toList();
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  //   return entries;
  // }

  Future<CustomerData?> getCustomerInformation(String email) async {
    // TODO: Restore email
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://portal.villagecirclerewards.com/crapis/customer/entry/level/$email'));

      http.StreamedResponse response = await request.send();
      var body = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        return customerDataFromJson(jsonEncode(body));
      } else {
        return null;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<int> reedemPoints(
    int amount,
    String ruleID,
    String token,
  ) async {
    var headers = {
      'x-api-version': '3.0',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://api.coniq.com/app/points-event/program/CircleRewards/spend-linked-offer/$ruleID/redeem'));
    request.body = json
        .encode({"location_id": "96157", "amount": '$amount', "type": "spend"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return response.statusCode;
  }
}
