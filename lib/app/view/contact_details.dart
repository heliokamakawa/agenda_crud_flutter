import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/view/contact_details_back.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = ContactDetailsBack(context);
    Contact contact = _back.contact;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
       
        var width = constraints.biggest.width; 
        var radius = width/3;
       // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(  
            children: [  
              (Uri.tryParse(contact.urlAvatar).isAbsolute) ? 
                CircleAvatar(
                  backgroundImage: NetworkImage(contact.urlAvatar), 
                  radius:radius ,
                ) : 
                CircleAvatar(
                  child: Icon(
                    Icons.person, 
                    size: width/2,
                  ),
                  radius:radius ,
                ),
              Center( 
                child: Text('${contact.nome}', style:  TextStyle(fontSize: 30),),
              ),
              Card( 
                child: ListTile( 
                  title: Text('Telefone:'), 
                  subtitle: Text('${contact.telefone}'),
                ),
              ),
              Card( 
                child: ListTile( 
                  title: Text('E-mail:'), 
                  subtitle: Text('${contact.email}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton( 
            child: Icon(Icons.arrow_back),
            onPressed: (){
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}