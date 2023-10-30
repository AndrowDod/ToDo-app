import 'package:flutter/material.dart';
import '../models/database.dart';
import '../models/database_model.dart';
import 'todo_page.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  DbHellper hellper = DbHellper();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final thewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Note',
          style: TextStyle(fontSize: thewidth * 0.05, fontFamily: font),
        ),
      ),
      body: Column(
        children: [
          // the field of text
          Padding(
            padding: EdgeInsets.all(thewidth * 0.04),
            child: TextField(
              style: TextStyle(fontFamily: font, fontSize: thewidth * 0.045),
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'New Task',
                  hintStyle:
                      TextStyle(fontFamily: font, fontSize: thewidth * 0.04),
                  border: const OutlineInputBorder()),
            ),
          ),

          //the button to save
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(185, 121, 85, 72)),
            onPressed: () {
              if (!controller.text.isNotEmpty) {
                return;
              } else {
                TaskModel tasks =
                    TaskModel({'task': controller.text, 'comp': 0});
                hellper.insertData(tasks);
              }
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
              controller.clear();
            },
            child: Text(
              "save",
              style: TextStyle(
                  fontFamily: font,
                  fontSize: MediaQuery.of(context).size.width * 0.045),
            ),
          )
        ],
      ),
    );
  }
}
