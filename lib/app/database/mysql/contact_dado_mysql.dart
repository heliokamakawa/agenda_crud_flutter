

import 'dart:convert';

import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:http/http.dart' as http;

class ContactDAOMySQL implements ContactDAO {
  final uriREST = Uri.parse('http://192.168.1.8:8080/contato');

  @override
  Future<List<Contact>> find() async {
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

  @override
  remove(id) async{
    var uri = Uri.parse('http://192.168.1.8:8080/contato/$id');
    var resposta = await http.delete(uri);
    if(resposta.statusCode != 200) throw Exception('Erro REST API.');
  }
  
    @override
    save(Contact contact) async {
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
        var resposta = await http.post(uriREST,headers: headers,body: contactJson);
        statusCode = resposta.statusCode;
      }else{
        var resposta = await http.put(uriREST,headers: headers,body:contactJson );
        statusCode = resposta.statusCode;
      }
      if(statusCode != 200) throw Exception('Erro REST API.');
  }

}