import 'package:agenda_crud/app/injection.dart';
import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'package:http/http.dart' as http;

void main() async {
  var resposta = await http.get('http://192.168.1.8:8080/contato');
  print(resposta.body);
  setupInjection();
  runApp(MyApp());
}