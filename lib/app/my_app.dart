import 'package:agenda_crud/app/view/contact_details.dart';
import 'package:agenda_crud/app/view/contact_form.dart';
import 'package:agenda_crud/app/view/contact_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const CONTACT_FORM =  'contact-form';
  static const CONTACT_DETAILS = 'contact-details';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
      HOME : (context) => ContactList(),
      CONTACT_FORM : (context) => ContactForm(),
      CONTACT_DETAILS: (context) => ContactDetails()
      },
    );
  }
}