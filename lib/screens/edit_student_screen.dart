import 'package:crudlp3/common/common_colors.dart';
import 'package:crudlp3/database.dart';
import 'package:crudlp3/screens/edit_student_form_screen.dart';
import 'package:flutter/material.dart';

class EditStundentScreen extends StatelessWidget {
  const EditStundentScreen(
      //required: Diz que é obrigatorio
      {Key? key,
      required this.id,
      required this.nameOld,
      required this.emailOld})
      : super(key: key);
  final String id;
  final String nameOld;
  final String emailOld;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      //Chama a outra tela do EditStudentFormScreen
      body: EditStudentFormScreen(
        idOld: id,
        nameOld: nameOld,
        emailOld: emailOld,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommonColors.white,
        title: Text("Alteração de Dados"),
        //permite adicionar ações no botão
        actions: [
          IconButton(
              onPressed: () async {
                await Database.deleteStudent(id: id);
                //volta para pagina de tras
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.delete,
                color: CommonColors.red,
                size: 32,
              ))
        ],
      ),
    );
  }
}
