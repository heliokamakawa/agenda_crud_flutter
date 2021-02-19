

import 'package:agenda_crud/app/domain/entities/contact.dart';

abstract class ContactDAO{

  save(Contact contact); 

  remove(int id); 

  Future<List<Contact>> find();

}