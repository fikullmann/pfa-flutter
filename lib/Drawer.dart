import 'package:flutter/material.dart';

final drawer = Drawer(
// Add a ListView to the drawer. This ensures the user can scroll
// through the options in the drawer if there isn't enough vertical
// space to fit everything.
  child: ListView(
// Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.purple[100]!),
        child: Text(
            'Drawer Header',
            style: TextStyle(fontSize: 20.0),
        ),
      ),
      ListTile(
        title: const Text('Todo'),
        onTap: () {
// Update the state of the app.
// ...
        },
      ),
      ListTile(
        title: const Text('Bubble wrap'),
        onTap: () {
// Update the state of the app.
// ...
        },
      ),
    ],
  ),
);