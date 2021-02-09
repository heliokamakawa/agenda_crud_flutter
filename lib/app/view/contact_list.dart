import 'package:agenda_crud/app/database/script.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../my_app.dart';

class ContactList  extends StatelessWidget {

  Future<List<Map<String,dynamic>>> _buscar() async{
    String path = join( await getDatabasesPath(), 'banco');
    Database db = await openDatabase(
      path, 
      version: 1, 
      onCreate: (db, v){
        db.execute(createTable);
        db.execute(insert1);
        db.execute(insert2);
        db.execute(insert3);
      }
      );
      return db.query('contact');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro){
        if(futuro.hasData){
          var lista = futuro.data;
          return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
             onPressed: (){
               Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
             }
             )
        ],
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, i){
          var contato = lista[i];
          var avatar = CircleAvatar( backgroundImage: NetworkImage(contato['url_avatar']),);
          return ListTile(
            leading: avatar,
            title: Text(contato['nome']),
            subtitle:  Text(contato['telefone']),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.edit), onPressed: null),
                  IconButton(icon: Icon(Icons.delete), onPressed: null),
                ],
                ),
              ) ,
          );
        },
      )
      );

        }else{
          return Scaffold();
        }
      }
      );
    
  }
}