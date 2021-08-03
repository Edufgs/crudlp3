import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudlp3/database.dart';
import 'package:flutter/material.dart';

import 'edit_course_screen.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Database.courseList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
                "Erro no acesso aos dados dos estudantes"); //Se tiver erro
          } else if (snapshot.hasData) {
            //Return a lista de estudante (itemCount: snapshot.data!.docs.length: quantidade de itens e o "!" garante que o objeto não é nulo)
            //separatorBuilder: (BuildContext context, int index) => SizedBox(height: 5,) onde separa os estudantes, cria uma caixa com altura 5
            //
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                //Pega o Id do estudante, "!" garante que o objeto não é nulo
                //index é a posição
                String docId = snapshot.data!.docs[index].id;
                String name = snapshot.data!.docs[index].get('name');
                String departamento =
                    snapshot.data!.docs[index].get('departamento');
                //vai apresentar as informações
                return ListTile(
                  //se clicar no objeto vai fazer alguma coisa
                  //Vai mudar a tela levando os dados
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditCourseScreen(
                          id: docId,
                          nameOld: name,
                          departamentoOld: departamento))),
                  //"$" é para referenciar o nome, parecido com %d
                  title: Text("Nome: $name"),
                  subtitle: Text("Departamento: $departamento"),
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 5,
              ),
              itemCount: snapshot.data!.docs.length,
            );
          } else
            return Container(
              child: Text("Acesso a dados sem sucesso"),
            );
        });
  }
}
