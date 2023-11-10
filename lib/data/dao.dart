import 'package:seab/data/database.dart';
import 'package:sqflite/sqflite.dart';

class Dao {
  static const String usuario = 'CREATE TABLE Usuario('
      'Id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'Nome TEXT, '
      'Data TEXT, '
      'Email TEXT, '
      'Telefone TEXT)';

  static const String logado = 'CREATE TABLE Logado('
      'Logado INTEGER)';

  static const String sms = 'CREATE TABLE Sms('
      'Sms INTEGER)';

  save(nome, data, email, telefone) async {
    final Database bancoDeDados = await getDatabase();
    return await bancoDeDados.insert('Usuario', {
      'Nome': nome,
      'Data': data,
      'Email': email,
      'Telefone': telefone,
    });
  }
  Future<List<Map<String, dynamic>>> read() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> list = await bancoDeDados.query('Usuario', columns: ['Nome', 'Data', 'Email', 'Telefone']);
    return list;
  }
  Future<void> delete() async {
    final Database bancoDeDados = await getDatabase();
    await bancoDeDados.delete('Usuario');
  }

  bool _sit = false;
  Future<bool> logSit() async {
    final Database bancoDeDados = await getDatabase();
    final result = await bancoDeDados.query('Logado', columns: ['Logado']);
    if (result.isNotEmpty) {
      final logado = result.first['Logado'] as int;
      if (logado == 1) {
        _sit = true;
      } else {
        _sit = false;
      }
      print('Valor da coluna Logado: $_sit');
      return _sit;
      // Agora você pode armazenar o valor em uma variável se desejar
      // var variavelLogado = logado;
    } else {
      print('Nenhum registro encontrado na tabela Logado.');
      return false;
    }
  }
  bool get resultado => _sit;

  logIn() async {
    final Database bancoDeDados = await getDatabase();
    await bancoDeDados.delete('Logado');
    return await bancoDeDados.insert('Logado', {
      'Logado': 1
    });
  }
  logOut() async {
    final Database bancoDeDados = await getDatabase();
    await bancoDeDados.delete('Logado');
    return await bancoDeDados.insert('Logado', {
      'Logado': 0
    });
  }

  bool _sitSMS = false;
  Future<bool> smsSit() async {
    final Database bancoDeDados = await getDatabase();
    final result = await bancoDeDados.query('Sms', columns: ['Sms']);
    if (result.isNotEmpty) {
      final logado = result.first['Sms'] as int;
      if (logado == 1) {
        _sitSMS = true;
      } else {
        _sitSMS = false;
      }
      print('Valor da coluna SMS: $_sitSMS');
      return _sitSMS;
      // Agora você pode armazenar o valor em uma variável se desejar
      // var variavelLogado = logado;
    } else {
      print('Nenhum registro encontrado na tabela SMS.');
      return false;
    }
  }
  bool get resultadoSMS => _sitSMS;
  smsIn() async {
    final Database bancoDeDados = await getDatabase();
    await bancoDeDados.delete('Sms');
    return await bancoDeDados.insert('Sms', {
      'Sms': 1
    });
  }
  smsOut() async {
    final Database bancoDeDados = await getDatabase();
    await bancoDeDados.delete('Sms');
    return await bancoDeDados.insert('Sms', {
      'Sms': 0
    });
  }

}
