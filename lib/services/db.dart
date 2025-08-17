import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class AppDb {
  static Database? _db;

  static Future<Database> instance() async {
    if (_db != null) return _db!;
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, 'synapse.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS images (
            id TEXT PRIMARY KEY,
            file_path TEXT NOT NULL,
            created_at INTEGER NOT NULL,
            width INTEGER,
            height INTEGER,
            file_size INTEGER,
            thumb_path TEXT
          );
        ''');
        await db.execute(
          'CREATE INDEX IF NOT EXISTS idx_images_created ON images(created_at DESC);',
        );
        await db.execute('''
          CREATE TABLE IF NOT EXISTS uploads (
            id TEXT PRIMARY KEY,
            image_id TEXT NOT NULL,
            status TEXT NOT NULL,
            retry_count INTEGER NOT NULL DEFAULT 0,
            last_error TEXT,
            updated_at INTEGER NOT NULL,
            FOREIGN KEY(image_id) REFERENCES images(id)
          );
        ''');
        await db.execute(
          'CREATE INDEX IF NOT EXISTS idx_uploads_status ON uploads(status);',
        );
      },
    );
    return _db!;
  }
}
