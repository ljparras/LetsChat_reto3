import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/iu/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAh1Vm5QpiIssnzYLoTh0ZvCjBo3jd_onQ", 
      appId: "1:517353653841:web:af53a898babd5ca27f9a70", 
      messagingSenderId: "517353653841", 
      projectId: "letschat-499e5"
      ));
      runApp(const MyApp());
}
