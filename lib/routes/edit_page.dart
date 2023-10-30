import 'package:flutter/material.dart';
import 'package:todo_app_2/models/database_model.dart';
import '../models/database.dart';
import 'todo_page.dart';

// ignore: must_be_immutable
class EditNotePage extends StatefulWidget {
  EditNotePage({super.key, this.tasks});
  TaskModel? tasks;
  @override
  State<EditNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<EditNotePage> {
  @override
  void initState() {
    super.initState();
    controller.text = "${widget.tasks!.task}";
  }

  DbHellper hellper = DbHellper();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final thewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Note',
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
                var taskupdate = TaskModel({
                  'id': widget.tasks!.id,
                  'task': controller.text,
                  'comp': widget.tasks!.comp,
                });
                hellper.updatedata(taskupdate);
              }
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
              controller.clear();
            },
            child: Text(
              "edit",
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
