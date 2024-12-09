import 'dart:convert';

CustomerData? customerDataFromJson(String str) {
  final jsonData = json.decode(str);
  if (jsonData['status'] == 'success') {
    return CustomerData.fromJson(jsonData);
  } else {
    return null; // If status is not 'success', return null or handle the error
  }
}

String customerDataToJson(CustomerData data) => json.encode(data.toJson());

class CustomerData {
  final String? status;
  final String? emailAddress;
  final EntryData? entryData;
  final List<Entry>? transactionData;

  CustomerData({
    this.status,
    this.emailAddress,
    this.entryData,
    this.transactionData,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
        status: json["status"],
        emailAddress: json["email_addresss"],
        entryData: json['entry_data'] != null
            ? EntryData.fromJson(json["entry_data"])
            : null,
        transactionData: json["transaction_data"] != null
            ? List<Entry>.from(
                json["transaction_data"].map((x) => Entry.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "email_address": emailAddress,
        "entry_data": entryData?.toJson(),
        "transaction_data": transactionData != null
            ? List<dynamic>.from(transactionData!.map((x) => x.toJson()))
            : null,
      };
}

class EntryData {
  final int? customerId;
  final String? customerEmail;
  final String? customerName;
  final int? totalSpend;
  final int? entries;
  final String? tier;

  EntryData({
    this.customerId,
    this.customerEmail,
    this.customerName,
    this.totalSpend,
    this.entries,
    this.tier,
  });

  factory EntryData.fromJson(Map<String, dynamic> json) => EntryData(
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

class Entry {
  final int? transactionId;
  final String? locationName;
  final String? customerName;
  final int? totalSpend;
  final int? totalEntries;
  final DateTime? transactionDate;

  Entry({
    this.transactionId,
    this.locationName,
    this.customerName,
    this.totalSpend,
    this.totalEntries,
    this.transactionDate,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        transactionId: json["transaction_id"],
        locationName: json["location_name"],
        customerName: json["customer_name"],
        totalSpend: json["total_spend"],
        totalEntries: json["total_entries"],
        transactionDate: DateTime.parse(json["transaction_date"]),
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "location_name": locationName,
        "customer_name": customerName,
        "total_spend": totalSpend,
        "total_entries": totalEntries,
        "transaction_date": transactionDate != null
            ? "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}"
            : null,
      };
}
