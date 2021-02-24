

import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService{
 // var dao = ContactDAOImpl();
 var dao = GetIt.I.get<ContactDAO>();

}