import 'package:flutter/material.dart';
import 'package:sign_in/pages/home_screen.dart';
import 'package:sign_in/pages/signed_in.dart';
// Step 2
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // Step 4
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }

  // Step 3
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/signed_in',
        builder: (context, state) => SignedIn(username: state.extra as String),
      ),
    ],
  );
}
