import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _tel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('User');
    return Scaffold(
      appBar: AppBar(
        title: Text("register"),
        actions: [
          IconButton(onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              GoogleSignIn().signOut();
            });
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login(),
            ));
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Form(
          child: ListView(
            children: [
              Text("name"),
              TextFormField(
                controller: _name,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "enter your name plz";
                  }
                  return null;
                })),
                Text("tel"),
                TextFormField(
                  controller: _tel,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter your number plz";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    print(FirebaseAuth.instance.currentUser);
                    final uid = FirebaseAuth.instance.currentUser!.uid;
                    user.doc(uid).set({
                      "fullname": _name.text,
                      "telephone": _tel.text,
                    });
                  },
                  child: Text("Save"))
            ],
          ),)),
    );
  }
}