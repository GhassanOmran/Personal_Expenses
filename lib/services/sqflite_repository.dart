import 'package:personal_expenses/models/transaction.dart' as model;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteRepository {
  static Database? _database;
  static const _databaseName = 'transactions_list.db';
  static const _databaseVersion = 1;

  static const table = 'transactions';
  static const columnId = '_id';
  static const columntitle = 'title';
  static const columnamount = 'amount';
  static const columndate = 'date';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      version: _databaseVersion,
      onCreate: (Database db, int version) async {
        await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columntitle TEXT NOT NULL,
        $columnamount TEXT NOT NULL,
        $columndate TEXT NOT NULL
      )
    ''');
      },
    );
  }

  Future<List<model.Transaction>?> loadTransactionList() async {
    final db = await database;
    List<Map<String, dynamic>> list = await db.rawQuery('SELECT * FROM $table');
    List<model.Transaction> transactions =
        list.map((e) => model.Transaction.fromMap(e)).toList();
    return transactions;
  }

  Future<void> saveTransactionList(model.Transaction transaction) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO $table($columntitle,  $columnamount, $columndate) VALUES("${transaction.title}", "${transaction.amount}", "${transaction.date}")');
    });
  }
}
