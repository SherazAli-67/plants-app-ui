import 'package:flutter/material.dart';
import 'package:plants_app/constants/string_const.dart';
import 'package:plants_app/providers/cart_provider.dart';
import 'package:plants_app/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: StringConst.appFontFamily,
      ),
      routerConfig: router,
      builder: (ctx, child) => child!,
    );
  }
}
