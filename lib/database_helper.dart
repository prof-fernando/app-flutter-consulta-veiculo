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
                                 idveiculo integer.   primary key autoincrement,
                                 placa text,
                                 modelo text
                              );

                               ''');
      },
    );
  }

  Future<int> gravar(String placa, String modelo) async {
    final database = await getDatabase();
    return database.insert('veiculo', {'placa': placa, 'modelo': modelo});
  }
}
