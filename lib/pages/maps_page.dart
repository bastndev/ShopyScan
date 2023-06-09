import 'package:flutter/material.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 11,
      itemBuilder: (_, i) => const ListTile(
        leading: Icon(Icons.fiber_manual_record_rounded, color: Colors.pink),
        title: Text('http:/welcome/mayer.com'),
        subtitle: Text('ID:1'),
        trailing: Icon(Icons.keyboard_arrow_right),
        // onTap: () => print('algo que'),
      )
    );
  }
}