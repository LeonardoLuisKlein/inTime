import 'package:flutter/material.dart';
import 'package:in_time/services/auth_services.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _logo = const AssetImage("images/logoInTime.png");
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLogin = true;
  String titulo = 'Faça o login abaixo';
  String actionButton = 'Login';
  String toggleButton = 'Ainda não possui uma conta? Cadastre-se';
  bool loading = false;

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Faça o login abaixo';
        actionButton = 'Login';
        toggleButton = 'Ainda não possui uma conta? Cadastre-se';
      } else {
        titulo = 'Cadastro';
        actionButton = 'Registrar';
        toggleButton = 'Voltar ao Login';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  login() async {
    setState(() {
      loading = true;
    });
    try {
      await context
          .read<AuthService>()
          .login(emailController.text, passwordController.text);
    } on AuthException catch (e) {
      setState(() {
        loading = false;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  register() async {
    setState(() {
      loading = true;
    });
    try {
      await context
          .read<AuthService>()
          .register(emailController.text, passwordController.text);
    } on AuthException catch (e) {
      setState(() {
        loading = false;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 100, 21, 161),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Form(
              key: formKey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Image(
                    image: _logo,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 30.0),
                  child: Text(
                    titulo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 36,
                        fontFamily: 'Montserrat',
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SizedBox(
                      height: 55.0,
                      child: TextFormField(
                        controller: emailController,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          filled: true,
                          fillColor: const Color(0xFF4C0D7C),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, digite seu email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SizedBox(
                      height: 55.0,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          filled: true,
                          fillColor: const Color(0xFF4C0D7C),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, informe sua senha';
                          } else if (value.length < 6) {
                            return 'A senha deve ter no mínimo 6 caracteres';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Esqueceu sua senha?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 101, 43),
                            elevation: 0,
                            fixedSize: const Size(300.0, 60.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (isLogin) {
                              login();
                            } else {
                              register();
                            }
                          }
                        },
                        child: (loading)
                            ? const Padding(
                                padding: EdgeInsets.all(16),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : (Text(
                                actionButton,
                                style: const TextStyle(
                                    fontSize: 36,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )))),
                Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: GestureDetector(
                        onTap: () {
                          setFormAction(!isLogin);
                        },
                        child: Text(toggleButton,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 24,
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 255, 255, 255))))),
              ])),
        )),
      ),
    );
  }
}
