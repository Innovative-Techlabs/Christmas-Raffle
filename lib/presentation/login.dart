import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skidata/presentation/app_textfield.dart';
import 'package:skidata/presentation/primaryelevatedbtn.dart';
import 'package:skidata/nav_provider.dart';
import 'package:skidata/utils/constants.dart';
import 'package:skidata/utils/responsive.dart';
import 'package:skidata/utils/string_ext.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: LayoutBuilder(builder: (
        context,
        constraints,
      ) {
        return Center(
          child: Container(
            width: Responsive.width(constraints.maxWidth),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Consumer<NavProvider>(builder: (
                  context,
                  navProvider,
                  child,
                ) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kSBox20V,
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/cr_logo.png',
                              height: 80,
                            ),
                            const Text(
                              'Circle Rewards',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kprimaryColor,
                                fontSize: 19,
                              ),
                            ),
                            kSBox20V,
                            const Text(
                              'Log In',
                              style: TextStyle(
                                  color: Color(0xff252733),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            kSBox5V,
                            const Text(
                              'Enter your email and password below',
                              style: smallGreyText,
                            ),
                            const Text(
                              '*use your circle rewards credentials to sign in',
                              style: smallGreyText,
                            ),
                          ],
                        ),
                      ),
                      kSBox30V,
                      navProvider.errorMessage.isNotEmpty
                          ? Text(
                              navProvider.errorMessage,
                              style: smallRedText,
                            )
                          : const SizedBox(),
                      const Text(
                        'EMAIL',
                        style: smallGreyTextBold,
                      ),
                      kSBox3V,
                      AppTextField(
                        onChanged: (p0) {
                          navProvider.setSignIn(
                              emailController.text, passwordController.text);
                        },
                        controller: emailController,
                        hintText: 'Email address',
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Email is required';
                          } else if (!p0.isEmail()) {
                            return 'Email is not valid';
                          }
                          return null;
                        },
                      ),
                      kSBox20V,
                      const Text(
                        'PASSWORD',
                        style: smallGreyTextBold,
                      ),
                      kSBox3V,
                      AppTextField(
                        obscurepaswd: navProvider.obscurePasswd,
                        onFieldSubmitted: (p0) {
                          navProvider.signIn(_formKey, context,
                              emailController.text, passwordController.text);
                        },
                        onChanged: (p0) {
                          navProvider.setSignIn(
                              emailController.text, passwordController.text);
                        },
                        controller: passwordController,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Password not provided';
                          }
                          return null;
                        },
                        hintText: 'Password',
                        suffixIcon: InkWell(
                          onTap: () {
                            navProvider.togglePasswdVisibility();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(1.5),
                            child: Icon(
                              Icons.visibility_off,
                              color: kTextGrey,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                      kSBox30V,
                      PrimaryElevatedBtn(
                        isActive: navProvider.isSigningIn,
                        label: 'Log In',
                        onPressed: navProvider.signInValid
                            ? () {
                                !navProvider.isSigningIn
                                    ? navProvider.signIn(
                                        _formKey,
                                        context,
                                        emailController.text,
                                        passwordController.text)
                                    : null;
                              }
                            : null,
                      ),
                      kSBox20V,
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     TextButton(
                      //       onPressed: () {},
                      //       child: Text(
                      //         'I\'ve forgotten my password',
                      //         style: smallRedText.copyWith(
                      //           decoration: TextDecoration.underline,
                      //           decorationColor: Colors.red,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      kSBox50V,
                    ],
                  );
                }),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
