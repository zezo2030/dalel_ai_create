import 'package:flutter/material.dart';
import 'package:dalel_ai/core/router/app_router.dart';

void main() {
  runApp(const DalelAI());
}

class DalelAI extends StatelessWidget {
  const DalelAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'DalelAI',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
