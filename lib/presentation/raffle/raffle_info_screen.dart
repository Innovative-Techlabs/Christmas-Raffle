import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skidata/models/customer_data_model.dart';
import 'package:skidata/models/prize_model.dart';
import 'package:skidata/models/user.dart';
import 'package:skidata/presentation/app_card.dart';
import 'package:skidata/presentation/drawer.dart';
import 'package:skidata/presentation/raffle/prize_card_widget.dart';
import 'package:skidata/presentation/terms_screen.dart';
import 'package:skidata/presentation/top_bar.dart';
import 'package:skidata/services/coniq_account_service.dart';
import 'package:skidata/services/prefs.dart';
import 'package:skidata/utils/constants.dart';
import 'package:skidata/utils/responsive.dart';
import 'package:skidata/utils/string_ext.dart';

class RaffleInfoScreen extends StatefulWidget {
  static const routeName = '/raffle';
  const RaffleInfoScreen({super.key});

  @override
  State<RaffleInfoScreen> createState() => _RaffleInfoScreenState();
}

class _RaffleInfoScreenState extends State<RaffleInfoScreen> {
  Future<CustomerData?> getUserData() async {
    return ConiqAccountService()
        .getCustomerInformation(AppPreferences.getEmailString()!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: kBackgroundGrey,
      body: FutureBuilder(
          future: getUserData(),
          builder: (
            context,
            snapshot,
          ) {
            Widget? child;

            if (snapshot.connectionState == ConnectionState.waiting) {
              child = const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                ),
              );
            } else if (snapshot.data == null) {
              child = const RaffleInfoWidget(
                entries: 11,
                validEntries: [],
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              child = RaffleInfoWidget(
                entries: snapshot.data?.entryData?.entries ?? 0,
                validEntries: snapshot.data?.transactionData! ?? [],
              );
            } else {
              child = Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return child;
          }),
    );
  }
}

class RaffleInfoWidget extends StatefulWidget {
  final List<Entry> validEntries;
  final int entries;
  const RaffleInfoWidget({
    super.key,
    required this.validEntries,
    required this.entries,
  });

  @override
  State<RaffleInfoWidget> createState() => _RaffleInfoWidgetState();
}

class _RaffleInfoWidgetState extends State<RaffleInfoWidget> {
  late ScrollController _prizesScrollControler;

  final toolTipKey1 = GlobalKey<TooltipState>();
  final toolTipKey2 = GlobalKey<TooltipState>();

  final toolTipKey3 = GlobalKey<TooltipState>();

  @override
  void initState() {
    super.initState();
    _prizesScrollControler = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 60),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  '${widget.entries}',
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: kDarkBlueTxtColor),
                ),
                const Text(
                  'Christmas Raffle Entries',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kDarkBlueTxtColor),
                ),
                kSBox10V,
                CustomCard(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    children: [
                      SizedBox(
                        height: 95,
                        child: Stack(
                          children: [
                            Theme(
                              data: ThemeData(
                                canvasColor: Colors.white,
                              ),
                              child: Stepper(
                                  elevation: 0,
                                  type: StepperType.horizontal,
                                  steps: <Step>[
                                    stepperbuilder(widget.entries >= 1 &&
                                        widget.entries <= 350),
                                    stepperbuilder(widget.entries >= 351 &&
                                        widget.entries <= 750),
                                    stepperbuilder(widget.entries >= 751),
                                  ]),
                            ),
                            Positioned(
                              left: 15,
                              right: 15,
                              bottom: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LevelIndicatorWidget(
                                    label: 'Tier 1',
                                    message:
                                        'Earn 1 entry for every KES 1,000 spent! Collect 1–70 entries to reach Tier 1. Higher tiers boost your chances to win exciting rewards, including a grand prize: a trip for two to Santorini!',
                                    toolTipKey: toolTipKey1,
                                  ),
                                  LevelIndicatorWidget(
                                    label: 'Tier 2',
                                    message:
                                        'Earn 1 entry for every KES 1,000 spent! Collect 71–150 entries to reach Tier 2. Higher tiers boost your chances to win exciting rewards, including a grand prize: a trip for two to Santorini!',
                                    toolTipKey: toolTipKey2,
                                  ),
                                  LevelIndicatorWidget(
                                    label: 'Tier 3',
                                    message:
                                        'Earn 1 entry for every KES 1,000 spent! Collect atleast 150 entries to reach Tier 3. Higher tiers boost your chances to win exciting rewards, including a grand prize: a trip for two to Santorini!',
                                    toolTipKey: toolTipKey3,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      kSBox5V,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "You have earned ${widget.entries} entries into Village Market's Christmas promotion. ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        color: kTextGrey,
                                      ),
                                ),
                                TextSpan(
                                  text: User.getTierText(widget.entries),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        color: kTextGrey,
                                      ),
                                ),
                                TextSpan(
                                  text:
                                      " Every KES 1,000 spent earns you an entry into the grand draw for incredible prizes, including the grand prize: a trip for two to Santorini. Keep shopping to boost your entries and increase your chances of winning exciting prizes! ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        color: kTextGrey,
                                      ),
                                ),
                                TextSpan(
                                  text: "T&C apply",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        color: kprimaryColor,
                                        decorationColor: kprimaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, TermsScreen.routeName);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                kSBox10V,
                CustomCard(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 10,
                    ),
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Prizes',
                            style: subTitleText,
                          ),
                        ],
                      ),
                      kSBox10V,
                      SizedBox(
                        height: 180,
                        child: RawScrollbar(
                          controller: _prizesScrollControler,
                          radius: const Radius.circular(4),
                          thumbVisibility: true,
                          trackColor: Colors.white,
                          thumbColor: kprimaryColor,
                          child: ListView.builder(
                            controller: _prizesScrollControler,
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              int reverseIndex = data.length - 1 - index;
                              Prize prize =
                                  prizeFromJson(jsonEncode(data))[reverseIndex];
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => PrizeCardWidget(
                                      prize: prize,
                                      entries: widget.entries,
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xffD9D9D9,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      margin: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      width: 150,
                                      height: 180,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/${prize.imageUrl}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 10,
                                      bottom: 0,
                                      child: TransparentLabelWidget(
                                        prize: prize,
                                        entries: widget.entries,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
                kSBox10V,
                RaffleEntriesSmallWidget(validEntries: widget.validEntries),
              ],
            ),
          ),
        ),
        const TopBar()
      ],
    );
  }

  @override
  void dispose() {
    _prizesScrollControler.dispose();
    super.dispose();
  }
}

class TransparentLabelWidget extends StatelessWidget {
  final Prize prize;
  final int entries;
  const TransparentLabelWidget({
    required this.prize,
    required this.entries,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.75),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            prize.tier,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Prize.getPrizeIcon(entries, prize.tier)
              ? const SizedBox()
              : const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 14,
                  ),
                )
        ],
      ),
    );
  }
}

class TableTextWidget extends StatelessWidget {
  final String data;
  const TableTextWidget({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Text(
        data,
        textAlign: TextAlign.left,
        maxLines: 1,
        style: const TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 14,
          color: kDarkBlueTxtColor,
        ),
      ),
    );
  }
}

class LevelIndicatorWidget extends StatelessWidget {
  final String label;
  final String message;
  final GlobalKey toolTipKey;

  const LevelIndicatorWidget({
    required this.label,
    required this.message,
    required this.toolTipKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      triggerMode: TooltipTriggerMode.tap,
      showDuration: const Duration(seconds: 2),
      message: message,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

Step stepperbuilder(
  bool isActive,
) {
  return Step(
    title: const SizedBox.shrink(),
    content: const SizedBox.shrink(),
    stepStyle: StepStyle(
      connectorThickness: 2,
      color: isActive ? kprimaryColor : kTextGrey,
      connectorColor: kprimaryColor,
    ),
    isActive: isActive,
    state: StepState.complete,
  );
}

class RaffleEntriesSmallWidget extends StatefulWidget {
  final List<Entry> validEntries;

  const RaffleEntriesSmallWidget({
    super.key,
    required this.validEntries,
  });

  @override
  State<RaffleEntriesSmallWidget> createState() =>
      _RaffleEntriesSmallWidgetState();
}

class _RaffleEntriesSmallWidgetState extends State<RaffleEntriesSmallWidget> {
  late ScrollController _entriesScrollControler;

  @override
  void initState() {
    super.initState();
    _entriesScrollControler = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (
      context,
      constraints,
    ) {
      return Container(
        height: 250,
        padding: const EdgeInsets.only(top: 30, left: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        width: Responsive.width(constraints.maxWidth),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Valid Entries',
                  style: subTitleText,
                ),
              ],
            ),
            div,
            widget.validEntries.isEmpty
                ? const Text(
                    'You have no entries at the moment.',
                    textAlign: TextAlign.center,
                  )
                : Expanded(
                    child: RawScrollbar(
                      controller: _entriesScrollControler,
                      radius: const Radius.circular(8),
                      thumbColor: kprimaryColor.withAlpha(180),
                      child: ListView.builder(
                        controller: _entriesScrollControler,
                        itemCount: widget.validEntries.length,
                        itemBuilder: (context, index) {
                          Entry entry = widget.validEntries[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    entry.locationName!,
                                    style: smallGreyText.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              kSBox5V,
                              Text(
                                "Earned ${entry.totalEntries.toString().addCommaOnly()} entries",
                                style:
                                    smallGreyText.copyWith(color: Colors.green),
                              ),
                              kSBox5V,
                              Row(
                                children: [
                                  Text(
                                    'Kes ${(entry.totalSpend).toString().addCommaOnly()} Spent',
                                    style: smallGreyText.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    DateFormat.yMMMEd().format(
                                      entry.transactionDate!,
                                    ),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: smallGreyText,
                                  ),
                                ],
                              ),
                              div,
                            ],
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _entriesScrollControler.dispose();
    super.dispose();
  }
}
