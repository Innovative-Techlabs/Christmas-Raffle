import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skidata/models/user.dart';
import 'package:skidata/nav_provider.dart';
import 'package:skidata/presentation/app_card.dart';
import 'package:skidata/presentation/app_textfield.dart';
import 'package:skidata/presentation/drawer.dart';
import 'package:skidata/presentation/primaryelevatedbtn.dart';
import 'package:skidata/presentation/top_bar.dart';
import 'package:skidata/services/coniq_account_service.dart';
import 'package:skidata/services/prefs.dart';
import 'package:skidata/utils/constants.dart';

class SubmitTicket extends StatefulWidget {
  static const routeName = 'parking';
  const SubmitTicket({super.key});

  @override
  State<SubmitTicket> createState() => _SubmitTicketState();
}

class _SubmitTicketState extends State<SubmitTicket> {
  late Future<User?> getUsers;

  @override
  void initState() {
    super.initState();

    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    var token = AppPreferences.getStoredToken()!;

    getUsers = ConiqAccountService().getUser(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: kBackgroundGrey,
      body: Center(
        child: FutureBuilder<User?>(
            future: getUsers,
            builder: (context, snapshot) {
              Widget? child;
              if (snapshot.connectionState == ConnectionState.waiting) {
                child = const CircularProgressIndicator(
                  strokeWidth: 1.5,
                );
              } else if (snapshot.hasData) {
                child = PayParking(
                  user: snapshot.data!,
                );
              } else {
                child = Text(snapshot.error.toString());
              }
              return child;
            }),
      ),
    );
  }
}

class PayParking extends StatefulWidget {
  final User user;
  const PayParking({
    super.key,
    required this.user,
  });

  @override
  State<PayParking> createState() => _PayParkingState();
}

class _PayParkingState extends State<PayParking> {
  final _formKkey = GlobalKey<FormState>();
  final TextEditingController _packingTicketController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKkey,
      child: Column(
        children: [
          const TopBar(),
          kSBox30V,
          Text(
            'Hello ${widget.user.firstName}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            'Pay for Parking with Points',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'You have ${widget.user.balance} Points',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: largeGreyText.color,
            ),
          ),
          kSBox20V,
          Consumer<NavProvider>(builder: (
            context,
            navProv,
            child,
          ) {
            return CustomCard(
              children: [
                const Text(
                  'PARKING TICKET ID',
                  style: smallGreyText,
                ),
                kSBox3V,
                AppTextField(
                  onFieldSubmitted: (p0) {
                    navProv.submitParkingTicketID(
                      _formKkey,
                      context,
                      _packingTicketController.text,
                    );
                  },
                  hintText: 'e.g. 12345678',
                  controller: _packingTicketController,
                  validator: (p0) {
                    if (_packingTicketController.text.isEmpty) {
                      return 'Please Enter a valid Ticket ID';
                    }
                    return null;
                  },
                ),
                kSBox30V,
                PrimaryElevatedBtn(
                  label: 'Check',
                  onPressed: () {
                    navProv.submitParkingTicketID(
                      _formKkey,
                      context,
                      _packingTicketController.text,
                    );
                  },
                ),
              ],
            );
          })
        ],
      ),
    );
  }

  @override
  void dispose() {
    _packingTicketController.dispose();
    super.dispose();
  }
}
