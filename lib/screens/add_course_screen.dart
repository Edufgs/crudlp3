import 'package:crudlp3/common/common_colors.dart';
import 'package:crudlp3/database.dart';
import 'package:flutter/material.dart';

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerDepartamento = TextEditingController();
    return Scaffold(
      backgroundColor: CommonColors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cadastro de Curso',
              style: TextStyle(
                  color: CommonColors.orange,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            //Campo de testo para digitar
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller:
                  controllerName, //Vai acessar as informações com o textFormFild. Onde pega o conteudo
              decoration: InputDecoration(
                labelText: "Nome do Curso",
              ),
            ),
            TextFormField(
              controller:
                  controllerDepartamento, //Vai acessar as informações com o textFormFild. Onde pega o conteudo
              decoration: InputDecoration(
                labelText: "Departamento",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Child é a identificação do botão e onPressed execução que faz quando é clicado
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Database.addCourse(
                        controllerName.text, controllerDepartamento.text);
                    Navigator.of(context).pop();
                  },
                  child: Text("Adicionar curso")),
            ),
          ],
        ),
      ),
    );
  }
}
