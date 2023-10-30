import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_2/routes/edit_page.dart';
import 'package:todo_app_2/routes/todo_page.dart';
import '../models/database.dart';

// ignore: must_be_immutable
class TaskTile extends StatelessWidget {
  TaskTile({
    super.key,
    required this.taskname,
    required this.deletetask,
    required this.value,
    required this.tasks,
    required this.onChange,
  });

//the varuable
  final String taskname;
  bool value;
  Function(BuildContext)? deletetask;
  dynamic onChange;
  dynamic tasks;

  DbHellper hellper = DbHellper();

  @override
  Widget build(BuildContext context) {
    final theheight = MediaQuery.of(context).size.height;
    final thewidth = MediaQuery.of(context).size.width;
    //the container of task
    return Padding(
      padding: EdgeInsets.only(
        top: theheight * 0.012,
        bottom: theheight * 0.012,
        left: thewidth * 0.03,
        right: thewidth * 0.03,
      ),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deletetask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        //the container of task
        child: Container(
          height: theheight * 0.08,
          width: thewidth,
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(12),

            //shadow
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 5,
                  blurStyle: BlurStyle.normal),
            ],
          ),
          //row of text
          child: Row(
            children: [
              Checkbox(value: value, onChanged: (value) => onChange()),
              Padding(
                padding: EdgeInsets.all(thewidth * 0.04),
                child: Text(
                  taskname,
                  style: TextStyle(
                    decoration:
                        value == false ? null : TextDecoration.lineThrough,
                    decorationColor: Colors.black,
                    fontSize: theheight * 0.021,
                    fontFamily: font,
                    color: const Color.fromARGB(206, 255, 255, 255),
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditNotePage(tasks: tasks),
                    ));
                  },
                  icon: Icon(
                    Icons.edit,
                    color: const Color.fromARGB(193, 255, 255, 255),
                    size: thewidth * 0.055,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
