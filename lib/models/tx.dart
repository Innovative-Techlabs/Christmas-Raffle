// import 'dart:convert';

// Transactions transactionsFromJson(String str) =>
//     Transactions.fromJson(json.decode(str));

// String transactionsToJson(Transactions data) => json.encode(data.toJson());

// class Transactions {
//   List<ActivityFeed> activityFeed;

//   Transactions({
//     required this.activityFeed,
//   });

//   factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
//         activityFeed: List<ActivityFeed>.from(
//             json["activity_feed"].map((x) => ActivityFeed.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "activity_feed":
//             List<dynamic>.from(activityFeed.map((x) => x.toJson())),
//       };
// }

// class ActivityFeed {
//   DateTime eventDate;
//   Location location;
//   Data data;

//   ActivityFeed({
//     required this.eventDate,
//     required this.location,
//     required this.data,
//   });

//   factory ActivityFeed.fromJson(Map<String, dynamic> json) => ActivityFeed(
//         eventDate: DateTime.parse(json["event_date"]),
//         location: Location.fromJson(json["location"]),
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "event_date": eventDate.toIso8601String(),
//         "location": location.toJson(),
//         "data": data.toJson(),
//       };
// }

// class Data {
//   String id;
//   num price;
//   Points points;

//   dynamic receiptId;
//   String? voidReason;
//   dynamic voucherRule;
//   dynamic receiptImage;
//   num refundAmount;

//   Data({
//     required this.id,
//     required this.price,
//     required this.points,
//     required this.receiptId,
//     required this.voidReason,
//     required this.voucherRule,
//     required this.receiptImage,
//     required this.refundAmount,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         price: json["price"],
//         points: Points.fromJson(json["points"]),
//         receiptId: json["receipt_id"],
//         voidReason: json["void_reason"],
//         voucherRule: json["voucher_rule"],
//         receiptImage: json["receipt_image"],
//         refundAmount: json["refund_amount"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "price": price,
//         "points": points.toJson(),
//         "receipt_id": receiptId,
//         "void_reason": voidReason,
//         "voucher_rule": voucherRule,
//         "receipt_image": receiptImage,
//         "refund_amount": refundAmount,
//       };
// }

// class Points {
//   int burned;
//   int earned;

//   Points({
//     required this.burned,
//     required this.earned,
//   });

//   factory Points.fromJson(Map<String, dynamic> json) => Points(
//         burned: json["burned"],
//         earned: json["earned"],
//       );

//   Map<String, dynamic> toJson() => {
//         "burned": burned,
//         "earned": earned,
//       };
// }

// class Location {
//   int id;
//   String name;

//   Location({
//     required this.id,
//     required this.name,
//   });

//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//         id: json["id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };
// }

// List<ActivityFeed> activityFeeds = [
//   ActivityFeed(
//     eventDate: DateTime.now(),
//     location: Location(id: 1, name: 'Art Caffe'),
//     data: Data(
//       voidReason: null,
//       refundAmount: 0,
//       receiptId: '',
//       voucherRule: '',
//       receiptImage: '',
//       id: 'TXN001',
//       price: 8770,
//       points: Points(burned: 10, earned: 20),
//     ),
//   ),
//   ActivityFeed(
//     eventDate: DateTime.now(),
//     location: Location(id: 1, name: 'BallPoint'),
//     data: Data(
//       voidReason: null,
//       refundAmount: 0,
//       receiptId: '',
//       voucherRule: '',
//       receiptImage: '',
//       id: 'TXN001',
//       price: 11560,
//       points: Points(burned: 10, earned: 20),
//     ),
//   ),
//   ActivityFeed(
//     eventDate: DateTime.now(),
//     location: Location(id: 1, name: 'Bowling'),
//     data: Data(
//       voidReason: null,
//       refundAmount: 0,
//       receiptId: '',
//       voucherRule: '',
//       receiptImage: '',
//       id: 'TXN001',
//       price: 15599,
//       points: Points(burned: 10, earned: 20),
//     ),
//   ),
// ];
