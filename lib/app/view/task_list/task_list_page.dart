import 'package:flutter/material.dart';
import 'package:task_manager/app/model/task.dart';
import 'package:task_manager/app/view/components/h1.dart';
import 'package:task_manager/app/view/components/shape.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xFF4db8ff),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Row(children: const [Shape()]),
                Column(
                  children: [
                    const SizedBox(height: 100),
                    Image.asset(
                      'assets/images/tasks-list-image.png',
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(height: 16),
                    const H1('Completa tus tareas', color: Colors.white,),
                    const SizedBox(height: 24),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 35),
            child: H1('Tareas'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                  itemBuilder: (_, index) => _TaskItem(taskList[index]),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: taskList.length
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 50,),
      ),
    );
  }
}
class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {Key? key}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          child: Row(
            children: [
              Icon(Icons.check_box_outline_blank, color: Theme.of(context).colorScheme.primary,),
              const SizedBox(width: 10,),
              Text(task.title),
            ],
          ),
        ),
    );
  }
}

final taskList = <Task>[
  Task('Sacar al perro', done: true),
  Task('Estudiar Flutter'),
  Task('Hacer la compra', done: true),
  Task('Limpiar casa'),
];