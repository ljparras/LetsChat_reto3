import 'package:flutter/material.dart';
import 'package:lets_chat/iu/chat.dart';
import 'package:lets_chat/iu/login.dart';
import 'package:lets_chat/proceso/autenticacion.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LetsChat',
      theme: ThemeData(
        
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'LetsChat'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
 
    return  StreamBuilder(stream:  autenticacion().estadoLogin, 
    builder: (context, respuesta){
      if (respuesta.hasData){
        return chat();
      }
      else{
        return login();
      }
    });
  }
}
