import 'package:unify/net/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  User user = auth.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Page'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[800],
      ),
      body: Column(
      )
    );
  }
}

 