import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lets_chat/iu/mensajes.dart';
import 'package:lets_chat/proceso/autenticacion.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;

class _chatState extends State<chat> {
  final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((autenticacion().usuarios?.email).toString()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded( 
                    child: TextField(
                        controller: mensaje,
                        focusNode: myFocusNode,
                        decoration:  InputDecoration(hintText: "Mensaje"),
                        onSubmitted: (valor) {
                          mensaje.text = valor;
                          if (mensaje.text.isNotEmpty){
                            myFocusNode.requestFocus();
                            fire.collection("Chat").doc().set({
                              "mensaje": mensaje.text,
                              "time": DateTime.now(),
                              "email": (autenticacion().usuarios?.email).toString()
                    });
                    mensaje.clear();
                    }
                        },
                      ),
                      
                    
                  ),
                  IconButton(onPressed: (){
                    if (mensaje.text.isNotEmpty){
                      fire.collection("Chat").doc().set({
                      "mensaje": mensaje.text,
                      "time": DateTime.now(),
                      "email": (autenticacion().usuarios?.email).toString()
                    });
                    mensaje.clear();
                    }
                  }, icon: Icon(Icons.send))
                ],
              ),
              Container(
                child: Expanded(child: mensajes()),
                )
            ],
          ),
        ),
    );
  }
}