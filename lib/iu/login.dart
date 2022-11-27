import 'package:flutter/material.dart';

import '../proceso/autenticacion.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}
final email = TextEditingController();
final password = TextEditingController();



class _loginState extends State<login> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entra o Registrate"),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller:  email,
              decoration: InputDecoration(label: Text("Email")),
            ),

            TextField(
              obscureText: true,
              controller:  password,
              decoration: InputDecoration(label: Text("Password")),
            ),
            Divider(),
            ElevatedButton.icon(
              onPressed: () {
                autenticacion()
                .iniciarSesion(em: email.text, pass: password.text);
              },
              icon: Icon(Icons.login),
              label: Text("Inciar Sesion"),
            ),
             Divider(),
             ElevatedButton.icon(
              onPressed: () {
                autenticacion()
                .CrearUsuario(em: email.text, pass: password.text);
              },
              icon: Icon(Icons.person_add),
              label: Text("Crear Cuenta"),
            ),
          ],
        ),
      ),
    );



    
  }
}