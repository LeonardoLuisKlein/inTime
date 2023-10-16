import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  final String? message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = false;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  register(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        throw AuthException('Senha fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Email já cadastrado');
      } else {
        throw AuthException('Erro ao cadastrar');
      }
    }
  }

  login(String email, String senha) async {
    print(email);
    print(senha);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      throw AuthException('Usuário ou senha incorretos');
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
