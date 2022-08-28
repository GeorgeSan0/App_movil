import 'package:app_movil/pages/forgot_pss_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller
  final _emailController = TextEditingController();
  final _passswordController = TextEditingController();
  bool _obscureText = true;

  Future singIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passswordController.text,
      );
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Usuario / Contra incorrectos.....',
            style: TextStyle(fontSize: 20),
          ),
          duration: const Duration(milliseconds: 1500),
          width: 300.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10.0)), // Inner padding for SnackBar content.
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Image(image: AssetImage('assets/montain.png')),

              //Hello Again
              Text(
                'Hola de Nuevo!!',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Bienvenido, Vive una Experiencia Inolvidable',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 50,
              ),

              //Emailtextfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Correo',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  obscureText: _obscureText,
                  controller: _passswordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Contraseña',
                    fillColor: Colors.grey[200],
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //Recuperar contraseña
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const ForgotPasswordPage();
                            },
                          ),
                        );
                      },
                      child: const Text('Recuperar Contraseña?',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //Sing in
              Container(
                padding: const EdgeInsets.only(left: 55, top: 0, right: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.orange,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: singIn,
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'No eres Miembro? ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text(
                      'Registrate Ahora',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
