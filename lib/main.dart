import 'package:flutter/material.dart';
import 'package:photo_album/Pages/user_albums_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Album App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserSelectionPage()
    );
  }
}
