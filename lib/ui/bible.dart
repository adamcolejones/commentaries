import 'package:unify/net/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class Bible extends StatefulWidget {
  const Bible({Key? key}) : super(key: key);

  @override
  State<Bible> createState() => _BibleState();
}

class _BibleState extends State<Bible> {
  User user = auth.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bible Page'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[800],
      ),
      body: Column(
      )
    );
  }
}

 