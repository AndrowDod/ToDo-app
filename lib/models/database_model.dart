class TaskModel {
  int? _id;
  int? _comp;
  String? _task;

  TaskModel(
    Map<String, dynamic> obj,
  ) {
    _id = obj['id'];
    _task = obj['task'];
    _comp = obj['comp'];
  }

  TaskModel.formMap(Map<dynamic, dynamic> data) {
    _id = data['id'];
    _task = data['task'];
    _comp = data['comp'];
  }

  Map<String, dynamic> toMap() => {'id': _id, 'task': _task, 'comp': _comp};

  int? get id => _id;
  int? get comp => _comp;
  String? get task => _task;
}
