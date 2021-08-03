import 'package:crudlp3/common/common_colors.dart';
import 'package:flutter/material.dart';

import 'add_course_screen.dart';
import 'course_list_screen.dart';

class Course extends StatelessWidget {
  const Course({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseListScreen(),
      backgroundColor: CommonColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommonColors.orange,
        title: Text("Cursos"),
      ),
      //Cria um botão para chamar outra tela
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddCourseScreen()));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: CommonColors.white,
        ),
      ),
    );
  }
}
