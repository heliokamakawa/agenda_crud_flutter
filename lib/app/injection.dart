

import 'package:agenda_crud/app/database/firestore/contact_dao_firestore.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database/sqlite/dao/contact_dao_impl.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


setupInjection() async{
  GetIt getIt = GetIt.I;
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getIt.registerSingleton<ContactDAO>(ContactDAOFirestore());
  getIt.registerSingleton<ContactService>(ContactService());
}