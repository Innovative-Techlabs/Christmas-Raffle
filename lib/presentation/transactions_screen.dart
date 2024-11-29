// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:skidata/models/tx.dart';
// import 'package:skidata/models/user.dart';
// import 'package:skidata/presentation/drawer.dart';
// import 'package:skidata/presentation/top_bar.dart';
// import 'package:skidata/services/coniq_account_service.dart';
// import 'package:skidata/services/prefs.dart';
// import 'package:skidata/utils/constants.dart';
// import 'package:skidata/utils/string_ext.dart';

// class TransactionsScreen extends StatelessWidget {
//   static const routeName = 'transactions';

//   const TransactionsScreen({super.key});

//   Future getUserData() async {
//     return Future.wait([
//       ConiqAccountService().getUser(AppPreferences.getStoredToken()!),
//       ConiqAccountService()
//           .getUserTransactions(AppPreferences.getStoredToken()!),
//     ]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       drawer: const AppDrawer(),
//       backgroundColor: kBackgroundGrey,
//       body: FutureBuilder(
//           future: getUserData(),
//           builder: (
//             context,
//             snapshot,
//           ) {
//             Widget? child;

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               child = const Center(
//                 child: CircularProgressIndicator(
//                   strokeWidth: 1.5,
//                 ),
//               );
//             } else if (snapshot.hasData) {
//               child = TransactionsWidget(
//                 screenWidth: screenWidth,
//                 div: div,
//                 tx: snapshot.data[1],
//                 user: snapshot.data[0],
//               );
//             } else {
//               child = const Center(
//                 child: Text('something went wrong'),
//               );
//             }
//             return child;
//           }),
//     );
//   }
// }

// class TransactionsWidget extends StatelessWidget {
//   final User user;
//   final Transactions tx;
//   const TransactionsWidget({
//     super.key,
//     required this.screenWidth,
//     required this.div,
//     required this.tx,
//     required this.user,
//   });

//   final double screenWidth;
//   final Divider div;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const TopBar(),
//         kSBox20V,
//         Text(
//           'Hi ${user.firstName}!\nYou have ${user.balance} Points',
//           textAlign: TextAlign.center,
//           style: mediumGreyText.copyWith(
//             color: Colors.black,
//           ),
//         ),
//         kSBox20V,
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 10,
//             ),
//             margin: screenWidth > 800
//                 ? const EdgeInsets.symmetric(horizontal: 50)
//                 : EdgeInsets.zero,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(4),
//               border: Border.all(
//                 color: const Color(0xffdfe0eb),
//               ),
//             ),
//             child: Column(
//               children: [
//                 kSBox10V,
//                 Row(
//                   children: [
//                     Text(
//                       'Your Transaction History',
//                       style: smallGreyTextBold.copyWith(
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 screenWidth > 800 ? kSBox30V : const SizedBox(),
//                 screenWidth > 800
//                     ? Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           const Flexible(
//                             child: Text(
//                               'Store name',
//                               style: smallGreyTextBold,
//                             ),
//                           ),
//                           Flexible(
//                             child: Container(
//                               alignment: Alignment.center,
//                               child: const Text(
//                                 'Points',
//                                 style: smallGreyTextBold,
//                               ),
//                             ),
//                           ),
//                           Flexible(
//                             child: Container(
//                               alignment: Alignment.center,
//                               child: const Text(
//                                 'Date',
//                                 style: smallGreyTextBold,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     : const SizedBox(),
//                 kSBox5V,
//                 div,
//                 kSBox5V,
//                 Expanded(
//                     child: tx.activityFeed.isEmpty
//                         ? const Center(
//                             child: Text(
//                               'Your Transaction history will appear here.',
//                               style: TextStyle(
//                                 fontStyle: FontStyle.italic,
//                                 color: kTextGrey,
//                               ),
//                             ),
//                           )
//                         : ListView.builder(
//                             itemCount: tx.activityFeed.length,
//                             itemBuilder: (ctx, index) {
//                               ActivityFeed activity = tx.activityFeed[index];
//                               return activity.data.refundAmount == 0 &&
//                                       activity.data.points.earned == 0 &&
//                                       activity.data.points.burned == 0
//                                   ? const SizedBox()
//                                   : screenWidth > 900
//                                       ? TxWidget(
//                                           div: div,
//                                           activity: activity,
//                                         )
//                                       : TxSmallWidget(
//                                           div: div,
//                                           activity: activity,
//                                         );
//                             }))
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class TxSmallWidget extends StatelessWidget {
//   final ActivityFeed activity;
//   final bool isRaffleEntry;

//   const TxSmallWidget({
//     super.key,
//     required this.div,
//     required this.activity,
//     this.isRaffleEntry = false,
//   });

//   final Divider div;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: Text(
//                 activity.location.name,
//                 style: smallGreyText.copyWith(
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         kSBox5V,
//         Text(
//           activity.data.refundAmount == 0
//               ? activity.data.points.earned != 0
//                   ? "Earned ${(activity.data.points.earned).toString().addCommaOnly()} points"
//                   : "Redeemed ${(activity.data.points.burned).toString().addCommaOnly()} points"
//               : "-${activity.data.refundAmount / 100} Points  Returned",
//           style: smallGreyText.copyWith(
//             color: activity.data.refundAmount == 0 ? Colors.green : Colors.red,
//           ),
//         ),
//         kSBox5V,
//         Row(
//           children: [
//             Text(
//               DateFormat.yMMMEd().format(
//                 activity.eventDate,
//               ),
//               textAlign: TextAlign.left,
//               overflow: TextOverflow.ellipsis,
//               style: smallGreyText.copyWith(
//                 color: Colors.black,
//               ),
//             ),
//             const Spacer(),
//             Text(
//               DateFormat.Hm().format(
//                 activity.eventDate,
//               ),
//               style: smallGreyText,
//             )
//           ],
//         ),
//         kSBox10V,
//         activity.data.points.earned != 0
//             ? Text(
//                 '${(activity.data.price).toString().addCommaOnly()} Spent',
//                 style: smallGreyText,
//               )
//             : const SizedBox(),
//         activity.data.points.earned != 0 ? kSBox10V : const SizedBox(),
//         activity.data.points.burned != 0
//             ? Text(
//                 'Value ${(activity.data.points.burned).toString().addCommaOnly()}Ksh',
//                 style: smallGreyText,
//               )
//             : const SizedBox(),
//         activity.data.points.earned != 0 ? kSBox10V : const SizedBox(),
//         div,
//       ],
//     );
//   }
// }

// class TxWidget extends StatelessWidget {
//   final ActivityFeed activity;
//   const TxWidget({
//     super.key,
//     required this.div,
//     required this.activity,
//   });

//   final Divider div;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         vertical: 20,
//         horizontal: 15,
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const CircleAvatar(
//                       backgroundColor: kBackgroundGrey,
//                       child: Icon(
//                         Icons.location_on,
//                         color: kprimaryColor,
//                       ),
//                     ),
//                     kSBox20H,
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           activity.location.name,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: smallGreyTextBold.copyWith(
//                             color: Colors.black,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       activity.data.refundAmount == 0
//                           ? activity.data.points.earned != 0
//                               ? "Earned ${(activity.data.points.earned).toString().addCommaOnly()} Points"
//                               : "Redeemed ${(activity.data.points.burned).toString().addCommaOnly()} Points"
//                           : "-${activity.data.refundAmount / 100} Points  Returned",
//                       style: smallGreyTextBold.copyWith(
//                         color: activity.data.refundAmount == 0
//                             ? Colors.green
//                             : Colors.red,
//                       ),
//                     ),
//                     activity.data.points.earned != 0
//                         ? Text(
//                             '${(activity.data.price).toString().addCommaOnly()} Spent',
//                             style: smallGreyText,
//                           )
//                         : const SizedBox(),
//                     activity.data.points.earned != 0
//                         ? kSBox10V
//                         : const SizedBox(),
//                     activity.data.points.burned != 0
//                         ? Text(
//                             'Value ${(activity.data.points.burned).toString().addCommaOnly()}Ksh',
//                             style: smallGreyText,
//                           )
//                         : const SizedBox(),
//                     activity.data.points.earned != 0
//                         ? kSBox10V
//                         : const SizedBox(),
//                   ],
//                 ),
//               ),
//               Expanded(
//                   child: Container(
//                 margin: const EdgeInsets.only(left: 100),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       DateFormat.yMMMEd().format(
//                         activity.eventDate,
//                       ),
//                       style: smallGreyTextBold.copyWith(
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       DateFormat.Hm().format(
//                         activity.eventDate,
//                       ),
//                       style: smallGreyText,
//                     ),
//                   ],
//                 ),
//               )),
//             ],
//           ),
//           kSBox10V,
//           div,
//         ],
//       ),
//     );
//   }
// }
