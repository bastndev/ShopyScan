import 'package:flutter/material.dart';

import 'package:flutter_qr/pages/home_page.dart';
import 'package:flutter_qr/pages/map_page.dart';
import 'package:flutter_qr/providers/scan_list_provider.dart';
import 'package:flutter_qr/providers/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'map': (_) => const MapPage(),
        },
        // theme: ThemeData(
         
        // ),
      ),
    );
  }
}
