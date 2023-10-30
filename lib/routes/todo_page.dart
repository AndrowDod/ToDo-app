import 'package:flutter/material.dart';
import 'package:todo_app_2/models/database_model.dart';
import '../models/database.dart';
import '../widgets/task_title.dart';

String font = 'mynerve';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => ToDoPageState();
}

class ToDoPageState extends State<ToDoPage> {
  late DbHellper hellper;

  late bool value;

  @override
  void initState() {
    super.initState();
    hellper = DbHellper();
  }

  _refreshPage() {
    setState(() {});
  }

  //DELET function
  void deletetask(int index, AsyncSnapshot a) {
    setState(() {
      hellper.deletedata(a.data[index]['id']);
    });
  }

  onChange(TaskModel tasks) {
    var taskupdate = TaskModel({
      'id': tasks.id,
      'task': tasks.task,
      'comp': tasks.comp == 0 ? 1 : 0,
    });

    hellper.updatedata(taskupdate);
    _refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    final theheight = MediaQuery.of(context).size.height;
    final thewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 212, 212),
      //the app bar
      appBar: AppBar(
        toolbarHeight: theheight * 0.09,
        //to do text
        title: Center(
          child: Text(
            'To Do',
            style: TextStyle(fontFamily: font, fontSize: theheight * 0.04),
          ),
        ),
      ),
      //the body
      body: FutureBuilder(
          future: hellper.readData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            TaskModel tasks =
                                TaskModel.formMap(snapshot.data![index]);
                            //the value of check box
                            value = tasks.comp == 0 ? false : true;
                            //
                            return TaskTile(
                              onChange: () => onChange(tasks),
                              value: value,
                              tasks: tasks,
                              taskname: "${tasks.task}",
                              deletetask: (context) =>
                                  deletetask(index, snapshot),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  //the button of add task
                  Padding(
                    padding: EdgeInsets.only(
                        right: thewidth * 0.035, bottom: theheight * 0.03),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed('addnote')
                              .then((value) => _refreshPage()),
                          child: const Icon(Icons.add),
                        )),
                  ),
                ],
              );
            }
          }),
    );
  }
}
