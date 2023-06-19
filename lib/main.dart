import 'package:flutter/material.dart';

import 'package:flutter_qr/pages/map_page.dart';
import 'package:flutter_qr/providers/scan_list_provider.dart';
import 'package:flutter_qr/providers/ui_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_qr/splash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  UiProvider()),
        ChangeNotifierProvider(create: (_) =>  ScanListProvider()),
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Qr Reader',
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashScreen(),
          'home': (_) => const SplashScreen(),
          'map': (_) => const MapPage(),
        },
      ),
    );
  }
}