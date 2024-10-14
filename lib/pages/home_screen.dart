import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
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
              decoration: const InputDecoration(
                hintText: "Username",
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.deepPurpleAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.key,
                  color: Colors.deepPurpleAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
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
              if (passwordController.text == "12345") {
                GoRouter.of(context).go('/signed_in', extra: usernameController.text); //switched from .push() to .go()
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
