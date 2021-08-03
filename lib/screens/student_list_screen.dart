import 'package:crudlp3/database.dart';
import 'package:crudlp3/screens/edit_student_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Database.studentList(),
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
                String email = snapshot.data!.docs[index].get('email');
                //vai apresentar as informações
                return ListTile(
                  //se clicar no objeto vai fazer alguma coisa
                  //Vai mudar a tela levando os dados
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditStundentScreen(
                          id: docId, nameOld: name, emailOld: email))),
                  //"$" é para referenciar o nome, parecido com %d
                  title: Text("Nome: $name"),
                  subtitle: Text("E-mail: $email"),
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
