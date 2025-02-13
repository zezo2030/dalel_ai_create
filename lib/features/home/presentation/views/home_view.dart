import 'package:dalel_ai/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  AppRouter.router.pushReplacement("/signin");
                }
              },
            ),
          ],
        ),
        body: Center(
          child: Text("Home"),
        ));
  }
}
