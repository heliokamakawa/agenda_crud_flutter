import 'package:agenda_crud/app/injection.dart';
import 'package:flutter/material.dart';
import 'app/my_app.dart';



import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  setupInjection();
  runApp(MyApp());
  
  //await Firebase.initializeApp();
  FirebaseFirestore.instance;
  /*var collection = FirebaseFirestore.instance.collection('contact');

  collection.doc().set({
    'name': 'Joaquim2',
    'phone': '(11) 9 9852-2222',
    'e-mail': 'joaquim2@email.com'
  });*/
}