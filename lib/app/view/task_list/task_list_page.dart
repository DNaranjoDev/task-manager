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
        children: const [
          _Header(),
          Expanded(
            child: _TaskList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }
}

class _TaskList extends StatefulWidget {
  const _TaskList({
    super.key,
  });

  @override
  State<_TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<_TaskList> {
  final taskList = <Task>[
    Task('Sacar al perro'),
    Task('Estudiar Flutter'),
    Task('Hacer la compra'),
    Task('Limpiar casa'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
      child: Column(
        children: [
          const H1('Tareas'),
          Expanded(
            child: ListView.separated(
                itemBuilder: (_, index) => _TaskItem(
                  taskList[index],
                  onTap: () {
                    taskList[index].done = !taskList[index].done;
                    setState(() {});
                  },
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: taskList.length),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
              const H1(
                'Completa tus tareas',
                color: Colors.white,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {Key? key, this.onTap}) : super(key: key);
  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          child: Row(
            children: [
              Icon(
                task.done
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank ,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(task.title),
            ],
          ),
        ),
      ),
    );
  }
}