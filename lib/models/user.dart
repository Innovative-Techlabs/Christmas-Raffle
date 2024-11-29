// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

User userDetailsFromJson(String str) => User.fromJson(json.decode(str));

String userDetailsToJson(User data) => json.encode(data.toJson());

class User {
  static String getTierText(int entries) {
    if (entries < 1) {
      return 'To unlock Tier 1, spend KES 5,000 and above in a single transaction across the mall.';
    } else if (entries > 1 && entries < 71) {
      return 'Earn ${71 - entries} more entries to join Tier Two!';
    } else if (entries > 70 && entries < 151) {
      return 'Earn ${151 - entries} more entries to join Tier Three!';
    } else {
      return "";
    }
  }

  String barcodeNumber;
  String barcodeImageUrl;
  BarcodeImages barcodeImages;
  String title;
  String firstName;
  String lastName;
  Tier tier;
  List<TierHistory>? tierHistory;
  int balance;
  int lifetimeBalance;
  int lifetimeSpend;
  DateTime subscriptionStartDate;

  User({
    required this.barcodeNumber,
    required this.barcodeImageUrl,
    required this.barcodeImages,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.tier,
    this.tierHistory,
    required this.balance,
    required this.lifetimeBalance,
    required this.lifetimeSpend,
    required this.subscriptionStartDate,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        barcodeNumber: json["barcode_number"],
        barcodeImageUrl: json["barcode_image_url"],
        barcodeImages: BarcodeImages.fromJson(json["barcode_images"]),
        title: json["title"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        tier: Tier.fromJson(json["tier"]),
        tierHistory: json["tier_history"] != null
            ? List<TierHistory>.from(
                json["tier_history"].map((x) => TierHistory.fromJson(x)))
            : null,
        balance: json["balance"],
        lifetimeBalance: json["lifetime_balance"],
        lifetimeSpend: json["lifetime_spend"],
        subscriptionStartDate: DateTime.parse(json["subscription_start_date"]),
      );

  Map<String, dynamic> toJson() => {
        "barcode_number": barcodeNumber,
        "barcode_image_url": barcodeImageUrl,
        "barcode_images": barcodeImages.toJson(),
        "title": title,
        "first_name": firstName,
        "last_name": lastName,
        "tier": tier.toJson(),
        "tier_history": tierHistory != null
            ? List<dynamic>.from(tierHistory!.map((x) => x.toJson()))
            : null,
        "balance": balance,
        "lifetime_balance": lifetimeBalance,
        "lifetime_spend": lifetimeSpend,
        "subscription_start_date": subscriptionStartDate.toIso8601String(),
      };
}

class BarcodeImages {
  String f1D;
  String fDm;
  String dfDm;
  String bDm;
  String dbDm;

  BarcodeImages({
    required this.f1D,
    required this.fDm,
    required this.dfDm,
    required this.bDm,
    required this.dbDm,
  });

  factory BarcodeImages.fromJson(Map<String, dynamic> json) => BarcodeImages(
        f1D: json["f1D"],
        fDm: json["fDM"],
        dfDm: json["dfDM"],
        bDm: json["bDM"],
        dbDm: json["dbDM"],
      );

  Map<String, dynamic> toJson() => {
        "f1D": f1D,
        "fDM": fDm,
        "dfDM": dfDm,
        "bDM": bDm,
        "dbDM": dbDm,
      };
}

class Tier {
  String label;
  dynamic expiryDate;
  DateTime assignedOn;
  int spentSinceJoin;
  int earnedSinceJoin;

  Tier({
    required this.label,
    required this.expiryDate,
    required this.assignedOn,
    required this.spentSinceJoin,
    required this.earnedSinceJoin,
  });

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
        label: json["label"],
        expiryDate: json["expiry_date"],
        assignedOn: DateTime.parse(json["assigned_on"]),
        spentSinceJoin: json["spent_since_join"],
        earnedSinceJoin: json["earned_since_join"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "expiry_date": expiryDate,
        "assigned_on": assignedOn.toIso8601String(),
        "spent_since_join": spentSinceJoin,
        "earned_since_join": earnedSinceJoin,
      };
}

class TierHistory {
  String tierId;
  String tierLabel;
  DateTime assignedOn;
  DateTime expiredOn;

  TierHistory({
    required this.tierId,
    required this.tierLabel,
    required this.assignedOn,
    required this.expiredOn,
  });

  factory TierHistory.fromJson(Map<String, dynamic> json) => TierHistory(
        tierId: json["tierId"],
        tierLabel: json["tierLabel"],
        assignedOn: DateTime.parse(json["assignedOn"]),
        expiredOn: DateTime.parse(json["expiredOn"]),
      );

  Map<String, dynamic> toJson() => {
        "tierId": tierId,
        "tierLabel": tierLabel,
        "assignedOn": assignedOn.toIso8601String(),
        "expiredOn": expiredOn.toIso8601String(),
      };
}

RaffleInfo raffleInfoFromJson(String str) =>
    RaffleInfo.fromJson(json.decode(str));

String raffleInfoToJson(RaffleInfo data) => json.encode(data.toJson());

class RaffleInfo {
  final String? status;
  final String? emailAddress;
  final Data? data;

  RaffleInfo({
    this.status,
    this.emailAddress,
    this.data,
  });

  factory RaffleInfo.fromJson(Map<String, dynamic> json) => RaffleInfo(
        status: json["status"],
        emailAddress: json["email_address"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "email_address": emailAddress,
        "data": data?.toJson(),
      };
}

class Data {
  final int? customerId;
  final String? customerEmail;
  final String? customerName;
  final int? totalSpend;
  final int? entries;
  final String? tier;

  Data({
    this.customerId,
    this.customerEmail,
    this.customerName,
    this.totalSpend,
    this.entries,
    this.tier,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        customerId: json["customer_id"],
        customerEmail: json["customer_email"],
        customerName: json["customer_name"],
        totalSpend: json["total_spend"],
        entries: json["entries"],
        tier: json["tier"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "customer_email": customerEmail,
        "customer_name": customerName,
        "total_spend": totalSpend,
        "entries": entries,
        "tier": tier,
      };
}
