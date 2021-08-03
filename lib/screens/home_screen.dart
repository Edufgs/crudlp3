import 'package:crudlp3/common/common_colors.dart';
import 'package:crudlp3/screens/add_student_screen.dart';
import 'package:crudlp3/screens/course.dart';
import 'package:crudlp3/screens/student.dart';
import 'package:flutter/material.dart';

class home_screen extends StatelessWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Child é a identificação do botão e onPressed execução que faz quando é clicado
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 50)),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Student()));
                  },
                  child: Text("Estudantes")),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Course()));
                  },
                  child: Text("Cursos")),
            ),
          ],
        ),
      ),
      backgroundColor: CommonColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommonColors.orange,
        title: Text("Crud"),
      ),
    );
  }
}
