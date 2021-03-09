import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:agenda_crud/app/view/contact_form_back.dart';

class ContactForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(ContactFormBack back) {
    return TextFormField (  
      validator: back.validateName,
      onSaved: (newValue) => back.contact.nome = newValue,
      initialValue: back.contact.nome,
      decoration: InputDecoration ( 
        labelText: 'Nome:'
      )
    );
  }
  
  Widget fieldEmail(ContactFormBack back) {
    return TextFormField (  
      validator: back.validateEmail,
      onSaved: (newValue) => back.contact.email= newValue,
      initialValue: back.contact.email,
      decoration: InputDecoration ( 
        labelText: 'E-mail:'
      )
    );
  }

  Widget fieldPhone(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField (  
      validator: back.validatePhone,
      onSaved: (newValue) => back.contact.telefone = newValue,
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
      onSaved: (newValue) => back.contact.urlAvatar= newValue,
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
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              _form.currentState.validate();
              _form.currentState.save();
              if(_back.isValid){
                _back.save();
                Navigator.of(context).pop();
              }
            })
        ],
      ),
      body: Padding(  
        padding: EdgeInsets.all(10),
        child: Form(  
          key: _form,
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