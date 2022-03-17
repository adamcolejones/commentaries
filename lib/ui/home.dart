import 'package:unify/net/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User user = auth.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[800],
      ),
      body: Column(
      )
    );
  }
}

 