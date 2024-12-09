import 'package:flutter/material.dart';
import 'package:skidata/presentation/app_card.dart';
import 'package:skidata/presentation/drawer.dart';
import 'package:skidata/presentation/top_bar.dart';
import 'package:skidata/utils/constants.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  static const routeName = 'terms';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: AppDrawer(),
      body: Column(
        children: [
          TopBar(),
          Text(
            'Terms and Conditions',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: kDarkBlueTxtColor),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: CustomCard(
                hasMinHeight: true,
                padding: EdgeInsets.all(20),
                children: [
                  Text(
                    "General Terms",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '''
• All participants must be of minimum age of 18 years to take part unless stated otherwise by the Management.
• Participants must be members of Village Market’s Circle Rewards programme.
• Participants must spend a minimum of KES 1,000 and above in a single transaction (not accumulated) during the promotion period in participating outlets and remember to collect their points upon checkout. Eligibility for rewards is determined by total spend:
   - Tier 3 Prizes: Total spend of KES 750,001 and above.
   - Tier 2 Prizes: Total spend of KES 350,001 to KES 750,000.
   - Tier 1 Prizes: Total spend of KES 1,000 to KES 350,000.
• By submitting participation details, entrants confirm their information is true, current, and complete. Village Market reserves the right to verify and/or disqualify entries in violation of the rules.
• Village Market reserves the right to monitor, edit, refuse, or remove information provided by participants.
• Participants must ensure their entries do not infringe on third-party rights, including intellectual property or privacy rights, and must not contain libelous, defamatory, obscene, or threatening material.
• Winners will be selected via a random e-draw at the end of the promotion. The decisions of the Betting Control and Licensing Board (BCLB) and the management team are final.
• Contacted winners must provide proof of participation and valid identification.
• Prizes must be collected within three (3) months; otherwise, they will be handed over to the BCLB.
• Prizes are non-transferable, non-exchangeable, and not payable in cash.
• Village Market is not responsible for delivery delays or issues caused by third-party couriers.
• Village Market reserves the right to publicize the promotion, including using winners’ photos and videos for marketing purposes.
• By participating, entrants consent to the collection and use of their data in compliance with the Data Protection Act, 2019.''',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Holiday Terms and Conditions",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '''
• Contacted winners must provide proof of participation and valid identification.
• Holiday and travel arrangements must be redeemed by December 31, 2025, directly with the designated agency or airline.
• Holiday prizes exclude visa fees, travel insurance, transportation, personal expenses, and other incidental costs.
• Village Market is not responsible for flight postponements or cancellations by partner airlines.
• Winners are responsible for obtaining travel documents, including passports and vaccination certificates.
• Village Market and its employees are not liable for personal injury, sickness, or loss incurred during the holiday period.''',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
