import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:agenda_crud/app/view/contact_form_back.dart';

class ContactForm extends StatelessWidget {

  Widget fieldName(ContactFormBack back) {
    return TextFormField (  
      initialValue: back.contact.nome,
      decoration: InputDecoration ( 
        labelText: 'Nome:'
      )
    );
  }
  
  Widget fieldEmail(ContactFormBack back) {
    return TextFormField (  
      initialValue: back.contact.email,
      decoration: InputDecoration ( 
        labelText: 'E-mail:'
      )
    );
  }

  Widget fieldPhone(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField (  
      initialValue: back.contact.telefone,
      inputFormatters: [mask],
      keyboardType: TextInputType.number,
      decoration: InputDecoration ( 
        labelText: 'Telefone:', 
        hintText: '(99) 9 9999-9999'
      )
    );
  }

  Widget fieldURLImage(ContactFormBack back) {
    return TextFormField (  
      initialValue: back.contact.urlAvatar,
      decoration: InputDecoration ( 
        labelText: 'Endereço Foto:', 
        hintText: 'http://www.site.com'
      )
    );
  }


   @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(  
        title: Text('Cadastro de Contato'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: null)
        ],
      ),
      body: Padding(  
        padding: EdgeInsets.all(10),
        child: Form(  
          child:  Column (
            children: [
              fieldName(_back),
              fieldEmail(_back),
              fieldPhone(_back), 
              fieldURLImage(_back)
            ],
            ),
        ),
      ),
      
    );
  }
}