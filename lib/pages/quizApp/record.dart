import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:date_format/date_format.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    final myRecordBox = Hive.box('myRecord');
    List listRecord = myRecordBox.get("listRecord") ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Record'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                listRecord.clear();
              });
              myRecordBox.put("listRecord", listRecord);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("All Record Deleted"),
                ),
              );
            },
          ),
        ],
      ),
      body: listRecord.isEmpty
          ? const Center(
              child: Text("No Record Found"),
            )
          : ListView.builder(
              itemCount: listRecord.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                                "Correct Answer: ${listRecord[index]['correctAnswer']}"),
                            subtitle: Text(
                                "Total Question: ${listRecord[index]['totalQuestion']}"),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  formatDate(listRecord[index]['time'], [
                                    dd,
                                    '-',
                                    mm,
                                    '-',
                                    yyyy,
                                  ]).toString(),
                                ),
                                Text(formatDate(listRecord[index]['time'], [
                                  hh,
                                  ':',
                                  nn,
                                  ':',
                                  ss,
                                  ' ',
                                  am
                                ]).toString()),
                              ],
                            ),
                            leading: const Icon(Icons.history_outlined),
                            dense: true,
                            iconColor: Colors.green,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              listRecord.removeAt(index);
                            });
                            myRecordBox.put("listRecord", listRecord);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Record Deleted"),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
