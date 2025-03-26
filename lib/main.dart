import 'package:coffee/coffee/view/splahs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'coffee/providers/cart_provider.dart';
import 'coffee/providers/tabs_provider.dart';

void main() {
  runApp(
    // For Provider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}

