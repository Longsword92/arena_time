import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'entitys/arena_scheduler.dart';

class DatabaseHelper {
  static const _databaseName = "arena_time.db";
  static const _databaseVersion = 2;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    return openDatabase(
      join(await getDatabasesPath(), '$_databaseName.db'),
      onCreate: _onCreate,
      version: _databaseVersion,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ArenaScheduler (
        id INTEGER NOT NULL,
        round INTEGER NOT NULL,
        serverName TEXT NOT NULL,
        type TEXT,
        startBlock INTEGER,
        endBlock INTEGER,
        requiredMedalCount INTEGER,
        ticketPrice INTEGER,
        additionalTicketPrice INTEGER,
        maxPurchaseCount INTEGER,
        maxPurchaseCountDuringInterval INTEGER,
        PRIMARY KEY ( id, round, serverName)
      )
    ''');
  }

  Future<void> insertArenaScheduler(ArenaScheduler arenaScheduler) async {
    final db = await database;
    await db.insert(
      'ArenaScheduler',
      arenaScheduler.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertArenaSchedulers(
      List<ArenaScheduler> arenaSchedulers) async {
    final db = await database;
    await db.transaction((txn) async {
      var batch = txn.batch();
      for (var emp in arenaSchedulers) {
        batch.insert('ArenaScheduler', emp.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      await batch.commit();
    });
  }

  Future<List<ArenaScheduler>> arenaSchedulers() async {
    final db = await database;
    final List<Map<String, Object?>> arenaSchedulers =
        await db.query('ArenaScheduler');
    return [
      for (final json in arenaSchedulers) ArenaScheduler.createInstance(json),
    ];
  }

  Future<void> updateArenaScheduler(ArenaScheduler arenaScheduler) async {
    final db = await database;
    await db.update(
      'ArenaScheduler',
      arenaScheduler.toMap(),
      where: 'id = ?',
      whereArgs: [arenaScheduler.id],
    );
  }

  Future<void> deleteArenaScheduler(int id) async {
    final db = await database;
    await db.delete(
      'ArenaScheduler',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllArenaScheduler(ServerName serverName) async {
    final db = await database;
    await db.delete('ArenaScheduler',
        where: 'serverName = ?', whereArgs: [serverName.name]);
  }
}
