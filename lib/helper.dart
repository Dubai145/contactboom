import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class helper {

  Future<Database> Getdatabase() async {

    // Get a location using getDatabasesPath

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

// open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {

      // When creating the db, create the table
      await db.execute(
          'create table contactbook (id integer primary key autoincrement, name TEXT, number TEXT)');
    });

    return database;
  }

  Future<void> insertdata(String nName, String nNumber, Database database12) async {

    String insertquery = "insert in to contactbook (name,number) values('$nName','$nNumber') ";

       int cnt =  await database12.rawInsert(insertquery);

       print(cnt);
  }


}
