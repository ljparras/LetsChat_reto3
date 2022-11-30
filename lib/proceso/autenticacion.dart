

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class autenticacion {
  final FirebaseAuth fire = FirebaseAuth.instance;
  User? get usuarios => fire.currentUser;
  Stream<User?> get estadoLogin => fire.authStateChanges();

    Future<void> iniciarSesion (
        {required String em, required String pass}) async {
      try {
        await fire.signInWithEmailAndPassword(email: em, password: pass);
      } on FirebaseAuthException catch (e) {
        print(e.code);
      }
    }

    Future<void> CrearUsuario (
          {required String em, required String pass}) async {
        try {
          await fire.createUserWithEmailAndPassword(email: em, password: pass);
        } on FirebaseAuthException catch (e) {
          print(e.code);
        }
      }

    Future<void> CerrarSesion() async {
      try {
        await fire.signOut();
      } on FirebaseAuthException catch (e) {
        print(e.code);
      }
    }
}