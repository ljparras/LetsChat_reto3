import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/proceso/autenticacion.dart';

class mensajes extends StatefulWidget {
  const mensajes({super.key});

  @override
  State<mensajes> createState() => _mensajesState();
}

class _mensajesState extends State<mensajes> {

Stream<QuerySnapshot> resp_consulta = FirebaseFirestore.instance
.collection("Chat")
.orderBy("time", descending: true).snapshots();


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: resp_consulta,
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> respuesta){
          return respuesta.data?.docs.isEmpty == false
          ? ListView.builder(
          itemCount: respuesta.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return 
            Card(
              color: (autenticacion().usuarios?.email).toString() ==
              respuesta.data!.docs[index].get("email").toString()
              ? Colors.teal[100]
              : Colors.blueGrey[100],
              child: ListTile(
                title: Text(
                  respuesta.data!.docs[index].get("mensaje"),
                  textAlign: (autenticacion().usuarios?.email).toString()==
                   respuesta.data!.docs[index].get("email").toString()
                   ? TextAlign.left
                   : TextAlign.right,
                ),
                subtitle: Text(respuesta.data!.docs[index].get("email"),
                textAlign: (autenticacion().usuarios?.email).toString()==
                   respuesta.data!.docs[index].get("email").toString()
                   ? TextAlign.left
                   : TextAlign.right,
                ),
              ),
            );
            
          
          },
        )
        : Center(
          child: CircularProgressIndicator(),
        );
      });
  }
}