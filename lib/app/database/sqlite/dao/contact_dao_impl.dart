import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class ContactDAOImpl implements ContactDAO{
  Database _db;

  @override
  Future<List<Contact>> find() async {
    _db = await  Connection.get();
    List<Map<String,dynamic>> resultado =  await _db.query('contact');
    List<Contact> lista = List.generate( resultado.length, (i){
      var linha = resultado[i];
      return Contact(
        id : linha['id'],
        nome: linha['nome'],
        telefone: linha['telefone'],
        email: linha['email'],
        urlAvatar:  linha['url_avatar']
      );
    }
    );

    return lista;
  }

  @override
  remove(dynamic id) async {
    _db = await  Connection.get();
    var sql ='DELETE FROM contact WHERE id = ?';
    _db.rawDelete(sql, [id]);
    }
  
    @override
  save(Contact contact) async {
    _db = await  Connection.get();
    var sql;
    if(contact.id == null){
      sql = 'INSERT INTO contact (nome, telefone,email,url_avatar) VALUES (?,?,?,?)';
      _db.rawInsert(sql,[contact.nome,contact.telefone,contact.email,contact.urlAvatar]);
    }else{
      sql = 'UPDATE contact SET nome = ?, telefone =?, email = ?, url_avatar= ? WHERE id = ?';
      _db.rawUpdate(sql,[contact.nome, contact.telefone, contact.email, contact.urlAvatar, contact.id]);
    }
  }

}