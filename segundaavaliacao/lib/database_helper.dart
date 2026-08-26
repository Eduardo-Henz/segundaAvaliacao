import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'pedido_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'pizzeria.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pedidos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tamanho TEXT,
        borda TEXT,
        bebida TEXT,
        sabor TEXT,
        quantidade INTEGER,
        total REAL,
        pagamento TEXT,
        status TEXT,
        data TEXT
      )
    ''');
  }

  Future<int> inserirPedido(PedidoModel pedido) async {
    final db = await database;
    return await db.insert('pedidos', pedido.toMap());
  }

  Future<List<PedidoModel>> listarPedidos() async {
    final db = await database;
    final resultado = await db.query('pedidos', orderBy: 'id DESC');
    return resultado.map((map) => PedidoModel.fromMap(map)).toList();
  }

  Future<int> atualizarPedido(PedidoModel pedido) async {
    final db = await database;
    return await db.update(
      'pedidos',
      pedido.toMap(),
      where: 'id = ?',
      whereArgs: [pedido.id],
    );
  }

  Future<int> excluirPedido(int id) async {
    final db = await database;
    return await db.delete(
      'pedidos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}