import 'package:crudlp3/database.dart';
import 'package:flutter/material.dart';
import 'package:crudlp3/common/common_colors.dart';
import 'package:crudlp3/screens/student_list_screen.dart';
import 'package:crudlp3/screens/add_student_screen.dart';

class Student extends StatelessWidget {
  const Student({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StudentListScreen(),
      backgroundColor: CommonColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommonColors.orange,
        title: Text("Estudantes"),
      ),
      //Cria um botão para chamar outra tela
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddStudentScreen()));
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
