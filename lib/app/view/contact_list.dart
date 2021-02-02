import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';

class ContactList  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: ListView(),
    );
  }
}