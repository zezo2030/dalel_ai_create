import 'package:flutter/material.dart';
import 'package:dalel_ai/core/router/app_router.dart';
import 'core/services/service_locator.dart';
import 'core/database/cache/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  getIt<CacheHelper>().init();
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
