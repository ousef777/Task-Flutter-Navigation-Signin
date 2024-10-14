import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  Color usernameBorderColor = Colors.deepPurpleAccent;
  Color passwordBorderColor = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: usernameBorderColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: usernameBorderColor,
                  ),
                ),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,   //hide the text
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.key,
                  color: passwordBorderColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: passwordBorderColor,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(Colors.deepPurpleAccent),
            ),
            onPressed: () {
              // Step 8
              if (usernameController.text.isEmpty) {
                showError(context, "Enter the Username");
                setState(() {
                  usernameBorderColor = Colors.red;
                });
              }
              else if (passwordController.text == "12345") {
                GoRouter.of(context).go('/signed_in', extra: usernameController.text); //switched from .push() to .go()
              }
              else {
                showError(context, "Wrong Password");
                setState(() {
                  usernameBorderColor = Colors.deepPurpleAccent;
                  passwordBorderColor = Colors.red;
                });
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Login", style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}

void showError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(message),
    )
  );
}