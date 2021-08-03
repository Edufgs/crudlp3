import 'package:crudlp3/database.dart';
import 'package:flutter/material.dart';

class EditStudentFormScreen extends StatefulWidget {
  const EditStudentFormScreen(
      {Key? key,
      required this.idOld,
      required this.nameOld,
      required this.emailOld})
      : super(key: key);
  final String idOld;
  final String nameOld;
  final String emailOld;

  @override
  _EditStudentFormScreenState createState() => _EditStudentFormScreenState();
}

class _EditStudentFormScreenState extends State<EditStudentFormScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  //Inicia o objetos a cima
  @override
  void initState() {
    nameController = TextEditingController(text: widget.nameOld);
    emailController = TextEditingController(text: widget.emailOld);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 24,
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome: "),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  //Da um espaço
                  SizedBox(
                    height: 20,
                  ),
                  Text("Email: "),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          await Database.updateStudent(
                              id: widget.idOld,
                              name: nameController.text,
                              email: emailController.text);
                          Navigator.of(context).pop();
                        },
                        child: Text("Atualizar")),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
