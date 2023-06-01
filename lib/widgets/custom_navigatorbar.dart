import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.safety_check),
          label: 'Map'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi),
          label: 'Directions'
        )
      ],
    );
  }
}