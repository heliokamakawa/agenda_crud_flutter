import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store{
  Contact contact;

  // diferenciar novo com alteração 
  _ContactFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    contact = (parameter == null) ? Contact() : parameter;
  }


  //salvar 


  //validações  


}