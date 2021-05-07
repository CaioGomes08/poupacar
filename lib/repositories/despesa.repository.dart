import 'package:path/path.dart';
import 'package:poupacar/models/despesa.model.dart';
import 'package:poupacar/settings.dart';
import 'package:sqflite/sqflite.dart';

class DespesaRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_DESPESAS_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  Future create(Despesa model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
        TABLE_NAME,
        model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<List<Despesa>> getDespesasHoje() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME,
        where: 'data = ?',
        whereArgs: [
          DateTime.now().toString().substring(0, 10),
        ],
      );
      await Future.delayed(Duration(milliseconds: 3000));
      return List.generate(maps.length, (i) {
        return Despesa(
          id: maps[i]['id'],
          data: maps[i]['data'],
          totalAbastecido: maps[i]['totalAbastecido'],
          totalLitros: maps[i]['totalLitros'],
        );
      });
    } catch (e) {
      print(e);
      return <Despesa>[];
    }
  }

  Future<List<Despesa>> getTodasDespesas() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME,
      );
      await Future.delayed(Duration(milliseconds: 3000));
      return List.generate(maps.length, (i) {
        return Despesa(
          id: maps[i]['id'],
          data: maps[i]['data'],
          totalAbastecido: maps[i]['totalAbastecido'],
          totalLitros: maps[i]['totalLitros'],
        );
      });
    } catch (e) {
      print(e);
      return <Despesa>[];
    }
  }

  Future<void> deleteDespesa(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        TABLE_NAME,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (e) {
      print(e);
    }
  }
}
