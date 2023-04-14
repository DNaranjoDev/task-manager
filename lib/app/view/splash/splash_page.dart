import 'package:flutter/material.dart';
import 'package:task_manager/app/view/components/h1.dart';
import 'package:task_manager/app/view/components/shape.dart';
import 'package:task_manager/app/view/task_list/task_list_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: const [
              Shape(),
            ],
          ),
          const SizedBox(
            height: 79,
          ),
          Image.asset(
            'assets/images/onboarding-image.png',
            width: 180,
            height: 168,
          ),
          const SizedBox(
            height: 99,
          ),
          const H1('Lista de Tareas'),
          const SizedBox(height: 21,),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad.',
                textAlign: TextAlign.center,
              ),
            ),
          const SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const TaskListPage();
                }));
              },
              child: const Text('Comencemos!')),
        ],
      ),
    );
  }
}
