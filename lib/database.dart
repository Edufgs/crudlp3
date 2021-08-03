import 'package:cloud_firestore/cloud_firestore.dart';

//Obtem a instancia do firebase
//Cria instance do banco firebase
final FirebaseFirestore firestore = FirebaseFirestore.instance;
//Coleção para a persistencia de dados
//Primeira parte do banco
final CollectionReference mainReference = firestore.collection("estudantes");
final CollectionReference mainReferenceCourse = firestore.collection("cursos");

class Database {
  //Criando metodo para persistir dados no banco (async: primeiro vai esperar a comunicação com o firebase para depois executar)
  static Future<void> addStudent(String name, String email) async {
    //Para pegar a referencia documentos (Ele cria toda hora que entra na função)
    DocumentReference documentReference = mainReference.doc();
    //montando a estrutura json para enviar dados ao firebase
    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
    };
    //Quando for persistido então imprime algo
    await documentReference
        .set(data)
        .whenComplete(() => print(documentReference));
  }

  //Adiciona cursos
  static Future<void> addCourse(String name, String departamento) async {
    //Para pegar a referencia documentos (Ele cria toda hora que entra na função)
    DocumentReference documentReference = mainReferenceCourse.doc();
    //montando a estrutura json para enviar dados ao firebase
    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "departamento": departamento,
    };
    //Quando for persistido então imprime algo
    await documentReference
        .set(data)
        .whenComplete(() => print(documentReference));
  }

  //Lista estudante
  static Stream<QuerySnapshot> studentList() {
    return mainReference.snapshots();
  }

  //Lista cursos
  static Stream<QuerySnapshot> courseList() {
    return mainReferenceCourse.snapshots();
  }

  //Modifica estudante
  static Future<void> updateStudent(
      {required id, required String name, required String email}) async {
    DocumentReference documentReference = mainReference.doc(id);
    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
    };
    await documentReference
        .update(data)
        .whenComplete(() => print("Dados atualizados com sucesso!!"));
  }

  //Modifica cursos
  static Future<void> updateCourse(
      {required id, required String name, required String departamento}) async {
    DocumentReference documentReference = mainReferenceCourse.doc(id);
    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "departamento": departamento,
    };
    await documentReference
        .update(data)
        .whenComplete(() => print("Dados atualizados com sucesso!!"));
  }

  //Deleta Estudante
  static Future<void> deleteStudent({required String id}) async {
    DocumentReference documentReference = mainReference.doc(id);
    //await faz esse processo ficar em mode de espera no banco então ele aguarda a hora dele chegar
    await documentReference
        .delete()
        .whenComplete(() => print("Estudante foi deletado com sucesso!!"))
        .catchError((e) => print(e));
  }

  //Deleta Curso
  static Future<void> deleteCourse({required String id}) async {
    DocumentReference documentReference = mainReferenceCourse.doc(id);
    //await faz esse processo ficar em mode de espera no banco então ele aguarda a hora dele chegar
    await documentReference
        .delete()
        .whenComplete(() => print("Curso foi deletado com sucesso!!"))
        .catchError((e) => print(e));
  }
}
