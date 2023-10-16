import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:in_time/meu_aplicativo.dart';
import 'package:in_time/services/auth_services.dart';
import 'package:provider/provider.dart';

void main(List<String> app) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
    ],
    child: const MeuAplicativo(),
  ));
}
