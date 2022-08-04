import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controller
  final _emailController = TextEditingController();
  final _passswordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passswordController.dispose();
    _confirmpasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future singUp() async {
    if (passwordConfirm()) {
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passswordController.text.trim());
    }

    //add user details
    addUserDetails(_firstNameController.text.trim(),
        _lastNameController.text.trim(), _emailController.text.trim());
  }

  Future addUserDetails(String firstName, String lastName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
    });
  }

  bool passwordConfirm() {
    if (_passswordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.supervised_user_circle_rounded,
              size: 100,
              color: Colors.orange,
            ),

            SizedBox(
              height: 75,
            ),

            //Hello Again
            Text(
              'Hello There!',
              style: GoogleFonts.bebasNeue(fontSize: 52, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Register below with your details',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),

            //Fistnametextfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'First Name',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //LastNametextfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Last Name',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //Emailtextfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Email',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                obscureText: true,
                controller: _passswordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Password',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // confirm password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                obscureText: true,
                controller: _confirmpasswordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Confirm Password',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //Sing in
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: singUp,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I am a membee! ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
