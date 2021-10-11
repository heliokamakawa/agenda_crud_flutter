import 'package:agenda_crud/app/database/mysql/contact_dado_mysql.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'database/sqlite/dao/contact_dao_impl.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


setupInjection() async{
  GetIt getIt = GetIt.I;
  
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  getIt.registerSingleton<ContactDAO>(ContactDAOMySQL());
  getIt.registerSingleton<ContactService>(ContactService());
}