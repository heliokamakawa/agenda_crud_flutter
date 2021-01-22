
import 'package:agenda_crud/app/view/my_home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Aula Flutter'),
    );
  }
}