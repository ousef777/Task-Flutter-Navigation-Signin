import 'package:flutter/material.dart';

class SignedIn extends StatelessWidget {
  // Step 5
  final String username;

  const SignedIn({
    Key? key,
    required this.username,
  }) : super(key: key);
  // Step 6

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Step 9
            Text("Welcome $username"),
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 140,
            ),
          ],
        ),
      ),
    );
  }
}
