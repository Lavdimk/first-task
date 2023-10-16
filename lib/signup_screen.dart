import 'theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage_screen.dart';
import 'custom_text_field.dart';

class SignupData {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorText = '';

  bool areFieldsEmpty() {
    return emailController.text.isEmpty ||
        fullNameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        passwordController.text.isEmpty;
  }
}

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final SignupData signupData = SignupData();

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      theme: themeManager.isDarkMode
          ? themeManager.darkTheme
          : themeManager.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: themeManager.appBarColor,
          toolbarHeight: 100.0,
          title: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 75.0),
              const Icon(
                Icons.offline_bolt,
                size: 24.0,
                color: Colors.white,
              ),
              const SizedBox(width: 5.0),
              const Text(
                'cueprise',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  themeManager.isDarkMode
                      ? Icons.nightlight_round
                      : Icons.wb_sunny,
                ),
                onPressed: () {
                  themeManager.toggleTheme();
                },
              ),
            ],
          ),
        ),
        backgroundColor: themeManager.isDarkMode
            ? themeManager.darkTheme.backgroundColor
            : themeManager.lightTheme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Account Sign-Up',
                  style: TextStyle(
                    color: themeManager.isDarkMode
                        ? themeManager.darkTheme.primaryColor
                        : themeManager.lightTheme.primaryColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Become a member and enjoy Cueprise\nservices and benefits',
                  style: TextStyle(
                    color: themeManager.isDarkMode
                        ? themeManager.darkTheme.primaryColor
                        : themeManager.lightTheme.primaryColor,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.7,
                  height: 20,
                ),
              ),
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: themeManager.isDarkMode
                        ? themeManager.darkTheme.primaryColor
                        : themeManager.lightTheme.primaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: CustomTextField(
                  labelText: 'johndoe@gmail.com',
                  controller: signupData.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: themeManager.isDarkMode
                        ? themeManager.darkTheme.primaryColor
                        : themeManager.lightTheme.primaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: CustomTextField(
                    labelText: "John Smith",
                    controller: signupData.fullNameController,
                    keyboardType: TextInputType.name,
                  )),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: themeManager.isDarkMode
                        ? themeManager.darkTheme.primaryColor
                        : themeManager.lightTheme.primaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: CustomTextField(
                    labelText: "e.g. 058838916784",
                    controller: signupData.phoneNumberController,
                    keyboardType: TextInputType.number,
                  )
                  ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: themeManager.isDarkMode
                        ? themeManager.darkTheme.primaryColor
                        : themeManager.lightTheme.primaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: CustomTextField(
                    labelText: "************",
                    controller: signupData.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                  )),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (signupData.areFieldsEmpty()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Fields are empty'),
                              content: const Text(
                                  'Please fill in all fields before registering.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomepageScreen(),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        themeManager.isDarkMode
                            ? themeManager.darkTheme.buttonColor
                            : themeManager.lightTheme.buttonColor,
                      ),
                      minimumSize:
                          MaterialStateProperty.all(const Size(500, 50)),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      minimumSize:
                          MaterialStateProperty.all(const Size(500, 50)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Sign Up With Google',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Center(
                child: Text(
                  'Already have an account? Sign in here',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: themeManager.isDarkMode
                        ? themeManager.darkTheme.primaryColor
                        : themeManager.lightTheme.primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
