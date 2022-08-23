import 'package:flutter/material.dart';
import 'package:noteapp/models/auth.dart';
import 'package:noteapp/screens/home.dart';
//import 'package:firebase_core/firebase_core.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var email = TextEditingController();
  var pass = TextEditingController();
  var key = GlobalKey<FormState>();
  bool isLoading = false;
  AuthFirebase auth = AuthFirebase();
  signIn() async {
    if (key.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      print('sign in called');
      dynamic x = await auth.signInEmail(email.text, pass.text);
      if (x == null) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Enter a valid User')));
      } else {
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image.asset(
                          'images/app.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text('LogIn'),
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          labelText: 'Enter Email',
                          hintText: 'abc@gmail.com',
                        ),
                        validator: (a) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(a.toString())
                              ? null
                              : 'Please enter valid email';
                        },
                      ),
                      TextFormField(
                        controller: pass,
                        decoration: const InputDecoration(
                          labelText: 'Enter Password',
                          hintText: '*****',
                        ),
                        obscureText: true,
                        validator: (a) {
                          String s = a.toString();
                          if (s.isEmpty || s.length < 8) {
                            return 'Please enter a valid password of atleast 8 characters';
                          }
                          return null;
                        },
                      ),
                      GestureDetector(
                        onTap: (() {
                          signIn();
                        }),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Signup Instead',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
