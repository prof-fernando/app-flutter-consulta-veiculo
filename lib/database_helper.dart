import 'package:persistencia_sqlite/model/veiculo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // referencia do banco de dados
  static Database? _database;

  Future<Database> getDatabase() async {
    // retorna a propria instancia caso ela exista
    if (_database != null) {
      return _database!;
    }
    // abrir a conexao
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'banco.xyz');
    return openDatabase(
      path,
      version: 1,
      onCreate: (banco, versao) {
        return banco.execute('''
                              create table veiculo (
                                 idveiculo integer primary key autoincrement,
                                 placa text,
                                 modelo text
                              );

                               ''');
      },
    );
  }

  Future<int> gravar(Veiculo v) async {
    final database = await getDatabase();
    return database.insert('veiculo', {
      'placa': v.placa,
      'modelo': v.modelo,
    });
  }

  Future<List<Veiculo>> buscarTodos() async {
    final database = await getDatabase();
    List<Map<String, dynamic>> listaMap = await database.query('veiculo');
    return List.generate(listaMap.length, (index) {
      return Veiculo.fromMap(listaMap[index]);
    });
  }

  Future<int> delete(Veiculo v) async {
    final database = await getDatabase();
    return database.delete(
      'veiculo',
      where: 'idveiculo = ?',
      whereArgs: [v.idVeiculo],
    );
  }
}
