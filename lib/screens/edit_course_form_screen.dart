import 'package:crudlp3/database.dart';
import 'package:flutter/material.dart';

class EditCourseFormScreen extends StatefulWidget {
  EditCourseFormScreen(
      {Key? key,
      required this.idOld,
      required this.nameOld,
      required this.departamentoOld})
      : super(key: key);

  final String idOld;
  final String nameOld;
  final String departamentoOld;

  @override
  _EditCourseFormScreenState createState() => _EditCourseFormScreenState();
}

class _EditCourseFormScreenState extends State<EditCourseFormScreen> {
  late TextEditingController nameController;
  late TextEditingController departamentoController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.nameOld);
    departamentoController =
        TextEditingController(text: widget.departamentoOld);
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
                  Text("Departamento: "),
                  TextFormField(
                    controller: departamentoController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          await Database.updateCourse(
                              id: widget.idOld,
                              name: nameController.text,
                              departamento: departamentoController.text);
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
