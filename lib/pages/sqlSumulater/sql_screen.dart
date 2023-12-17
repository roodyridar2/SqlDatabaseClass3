import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlSimulator extends StatefulWidget {
  const SqlSimulator({super.key});

  @override
  State<SqlSimulator> createState() => _SqlSimulatorState();
}

class _SqlSimulatorState extends State<SqlSimulator> {
  late Database _database;
  final TextEditingController _queryController = TextEditingController();
  String _result = '';
  List<String> _tableList = [];
  List<Map<String, dynamic>> _queryResults = [];
  List<String> _preBuiltCommands = [];

  String? _selectedTableName = 'users';
  int _commandExecutedCounter = 0;

  Color colorCounter = Colors.green;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'sql_simulator.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE users (id INTEGER PRIMARY KEY, first_name TEXT,last_name TEXT, age INTEGER, location TEXT)',
        );
      },
    );

    // add data to users table with name and locations and age and date time

    await _database.rawQuery(
      'INSERT INTO users (first_name , last_name, age, location) VALUES ("John","Doe", 25, "boston");',
    );
    await _database.rawQuery(
      'INSERT INTO users (first_name , last_name,age, location) VALUES ("John", "kastryo", 28, "boston");',
    );
    await _database.rawQuery(
      'INSERT INTO users (first_name ,last_name, age, location) VALUES ("roody", "ridar", 26, "myamar");',
    );
    await _database.rawQuery(
      'INSERT INTO users (first_name ,last_name, age, location) VALUES ("crimson", "knight", 31, "trurkey");',
    );
    await _database.rawQuery(
      'INSERT INTO users (first_name , last_name,age, location) VALUES ("garou", "karati",21, "japanese");',
    );
    await _database.rawQuery(
      'INSERT INTO users (first_name , last_name,age, location) VALUES ("saitama", "onePunch", 33, "japanese");',
    );
    await _database.rawQuery(
      'INSERT INTO users (first_name , last_name,age, location) VALUES ("genos", "cyber",25, "japanese");',
    );
    await _database.rawQuery(
      'INSERT INTO users (first_name , last_name,age, location) VALUES ("Shko", "magdid",20, "Kurdistan");',
    );
    await _database.rawQuery(
      'INSERT INTO users (first_name , last_name,age, location) VALUES ("ayub", "mahmood",20, "Kurdistan");',
    );
    await _database.rawQuery(
      'INSERT INTO users (first_name , last_name,age, location) VALUES ("ramyan", "palany",20, "Kurdistan");',
    );

    _updateTableList();
  }

  Future<void> _updateTableList() async {
    List<Map<String, dynamic>> tables = await _database
        .rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    setState(() {
      _tableList = tables.map((table) => table['name'].toString()).toList();
      _tableList.remove('android_metadata');
      _preBuiltCommands = _generatePreBuiltCommands();
    });
  }

  List<String> _generatePreBuiltCommands() {
    List<String> commands = [];
    if (_selectedTableName != null) {
      commands.add('SELECT * FROM $_selectedTableName;');
      commands.add(
          'CREATE TABLE $_selectedTableName (id INTEGER PRIMARY KEY, first_name TEXT, last_name TEXT, age INTEGER);');
      commands.add(
          'INSERT INTO $_selectedTableName (first_name , last_name, age) VALUES ("Shko", "magdid",20);');
      commands.add(
          'UPDATE $_selectedTableName SET age = 26 WHERE first_name = "John Doe";');
      commands.add(
          'DELETE FROM $_selectedTableName WHERE first_name = "John Doe";');
      commands.add(
          'SELECT first_name, age FROM $_selectedTableName WHERE age > 25;');
      commands.add(
          'SELECT first_name, COUNT(*) FROM $_selectedTableName GROUP BY first_name HAVING COUNT(*) > 1;');
    }
    return commands;
  }

  Future<void> _executeQuery(String query) async {
    _queryController.text = query;
    try {
      if (query.trim().toLowerCase().startsWith('create table')) {
        await _database.execute(query);

        _updateTableList();
        setState(() {
          _result = 'Table created successfully.';
          _queryResults = [];
        });
      } else {
        if (query.trim().toLowerCase().startsWith('select')) {
          List<Map<String, dynamic>> result = await _database.rawQuery(query);
          setState(() {
            _queryResults = result;
            _result = '';
          });
        } else if (query.trim().toLowerCase().startsWith('drop table')) {
          await _database.rawQuery(query);
          _updateTableList();
          _selectedTableName = _tableList.first;
          setState(() {
            _result = 'Table dropped successfully.';
            _queryResults = [];
          });
        } else {
          List<Map<String, dynamic>> result = await _database.rawQuery(query);
          _updateTableList();
          setState(() {
            _result = 'Query executed successfully.';
            _queryResults = result;
            // _queryResults = [];
          });
        }
      }
      setState(() {
        colorCounter = Colors.green;
        _commandExecutedCounter++;
      });
    } catch (e) {
      setState(() {
        colorCounter = Colors.red;
        _result = 'Error: $e';
        _queryResults = [];
      });
    }
  }

  Future<void> _resetDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'sql_simulator.db');

    await deleteDatabase(path);

    await _initDatabase();

    _selectedTableName = 'users';

    setState(() {
      _result = 'Database reset successfully.';
      _queryResults = [];
      _commandExecutedCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQL Simulator'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    title: const Text('Reset Database?'),
                    content: const Text(
                        'Are you sure you want to reset the database?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No',
                            style: TextStyle(color: Colors.red)),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          await _resetDatabase();
                        },
                        child: const Text('Yes',
                            style: TextStyle(color: Colors.green)),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              dropdownColor: Colors.green[600],
              isExpanded: true,
              value: null,
              underline: Container(
                color: Colors.green,
                height: 1,
              ),
              alignment: Alignment.centerLeft,
              hint: const Text('Select a pre-built command'),
              items: _preBuiltCommands.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(221, 255, 255, 255)),
                        ),
                        const Divider(
                            height: 1,
                            color: Color.fromARGB(255, 201, 195, 195)),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? selectedCommand) {
                if (selectedCommand != null) {
                  _queryController.text = selectedCommand;
                }
              },
            ),
            const SizedBox(height: 16),
            if (_tableList.isNotEmpty)
              Row(
                children: [
                  const Text(
                    'Tables:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 16),
                  DropdownButton<String>(
                    dropdownColor: Colors.green[600],
                    value: _selectedTableName ?? _tableList.first,
                    hint: const Text('Select a table'),
                    underline: Container(
                      color: Colors.green,
                      height: 1,
                    ),
                    items: _tableList.map((String tableName) {
                      return DropdownMenuItem<String>(
                        value: tableName,
                        child: Text(tableName),
                      );
                    }).toList(),
                    onChanged: (String? selectedTableName) {
                      setState(() {
                        _selectedTableName = selectedTableName;
                        _preBuiltCommands = _generatePreBuiltCommands();
                      });
                    },
                  ),
                ],
              )
            else
              DropdownButton<String>(
                value: null,
                hint: const Text('No tables created yet'),
                items: null,
                onChanged: (String? selectedTableName) {
                  return;
                },
              ),
            const SizedBox(height: 16),
            TextField(
              controller: _queryController,
              maxLines: null,
              decoration: InputDecoration(
                // labelText: 'Enter SQL Query',
                focusColor: Colors.green,
                fillColor: Colors.green,

                // labelText: 'Enter text',
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1),
                ),
                label: const Text('Enter SQL Query'),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => _queryController.clear(),
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Execute Query Button
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      // hide keyboard
                      if (_queryController.text.isEmpty) {
                        return;
                      }

                      FocusScope.of(context).requestFocus(FocusNode());
                      _executeQuery(_queryController.text);
                    },
                    child: const Text('Execute Query'),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10))
                          // shape: BoxShape.circle,
                          ),
                      child: Center(
                        child: Text(
                          '$_commandExecutedCounter',
                          style: TextStyle(
                            color: colorCounter,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // show table result for success query
            Expanded(
              child: _queryResults.isNotEmpty
                  ? Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: _queryResults.first.keys
                                  .map<DataColumn>(
                                      (key) => DataColumn(label: Text(key)))
                                  .toList(),
                              rows: _queryResults
                                  .map<DataRow>(
                                    (result) => DataRow(
                                      cells: result.values
                                          .map<DataCell>((value) =>
                                              DataCell(Text(value.toString())))
                                          .toList(),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_result),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
