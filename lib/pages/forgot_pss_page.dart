import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      print(_emailController.text.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Registro Correcto',
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
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Correo Incorrecto',
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
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/reset.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Recuperar Contraseña",
            style: GoogleFonts.bebasNeue(fontSize: 25, color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/password.png')),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Text(
                'Ingresa tu Correo con el cual quieres recuperar tu contrseña',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
              height: 20,
            ),
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
                      onPressed: passwordReset,
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
