import 'package:flutter/foundation.dart';
import 'package:task_manager/app/model/task.dart';
import 'package:task_manager/app/repository/task_repository.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _taskList = [];
  final TaskRepository _taskRepository = TaskRepository();

  Future<void> fetchTask() async {
    _taskList = await _taskRepository.getTasks();
    notifyListeners();
  }

  List<Task> get taskList => _taskList;

  onTaskDoneChange(Task task) {
    task.done = !task.done;
    _taskRepository.saveTasks(_taskList);
    notifyListeners();
  }
  void addNewTask(Task task) {
    _taskRepository.addTask(task);
    fetchTask();
  }
}