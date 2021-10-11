import 'dart:convert';

import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/injection.dart';
import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'package:http/http.dart' as http;

void main() async {
  var list = await buscarCodigoCurto();
  for(var item in list){
    print(item.nome);
  }
  setupInjection();
  runApp(MyApp());
}



var uriREST = Uri.parse('http://192.168.1.8:8080/contato');

Future<List<Contact>> buscar() async{
  var resposta = await http.get(uriREST);
  if(resposta.statusCode != 200) throw Exception('Erro REST API.');
  Iterable listDart = json.decode(resposta.body); 
  
  var listContact = <Contact>[];
  for(Map<String,dynamic> item in listDart){
    listContact.add(
      Contact(
        id: item['id'],
        nome: item['nome'],
        telefone:  item['telefone'],
        email:  item['email'],
        urlAvatar:  item['urlAvatar']
      )
    );
  } 
  return listContact;
}


Future<List<Contact>> buscarCodigoCurto() async{
  var resposta = await http.get(uriREST);
  if(resposta.statusCode != 200) throw Exception('Erro REST API.');
  Iterable listDart = json.decode(resposta.body); 
  var listContact = List<Contact>.from(
    listDart.map((item) => Contact(
        id: item['id'],
        nome: item['nome'],
        telefone:  item['telefone'],
        email:  item['email'],
        urlAvatar:  item['urlAvatar']
    ))
  );
  return listContact;
}

salvar(Contact contact) async{
  var headers = {
    'Content-Type': 'application/json'
  };
  var contactJson = jsonEncode(
    {
      'id': contact.id,
      'nome': contact.nome,
      'telefone': contact.telefone,
      'email': contact.email,
      'urlAvatar': contact.urlAvatar
    }
  );

  int statusCode = 0;
  if(contact.id == null){
    //salvar
    var resposta = await http.post(uriREST,headers: headers,body: contactJson);
    statusCode = resposta.statusCode;
  }else{
    //alterar
    var resposta = await http.put(uriREST,headers: headers,body:contactJson );
    statusCode = resposta.statusCode;
  }
   if(statusCode != 200) throw Exception('Erro REST API.');
}

excluir(int id) async{
  var uri = Uri.parse('http://192.168.1.8:8080/contato/$id');
  var resposta = await http.delete(uri);
  if(resposta.statusCode != 200) throw Exception('Erro REST API.');
}