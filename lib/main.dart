import 'package:crudlp3/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //Inicia o banco Firebase e só precisa iniciar 1 vez
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// "StatelessWidget" Não escutar estado de nenhum componente, quando deseja executar algum processo dependendo do estado dele
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Configuração do ambiente
    //Fornece configuração para o MyApp
    return MaterialApp(
      title: 'Crud',
      debugShowCheckedModeBanner: false,
      //cores do tema, o tema da aplicaçao toda
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: home_screen(),
    );
  }
}
