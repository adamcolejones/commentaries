import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

FirebaseAuth auth = FirebaseAuth.instance;
late User user;
final CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');

Future<bool> signIn(String email, String password) async {
  try {
    // ignore: unused_local_variable
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    // User user = result.user;
    // auth.setPersistence(Persistence.SESSION),
    debugPrint('   Authentication: Sign in Successful');
    return Future.value(true);
  } catch (e) {
    // ignore: avoid_print
    debugPrint('>> Authentication: Sign in Error');
    // account does not exist
    return Future.value(false);
  }
}

// Use field path to get the field data

Future<bool> register(String email, String password, String firstName, String lastName, String userName) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  // User user;
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
  try {
    // ignore: unused_local_variable
    UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password); // <-- user account is created on first press
    User user = result.user!;
    debugPrint('   register: current user got');
    debugPrint('   register: user.id = ${user.uid}');  // <-----------this will actually print the current userID
    debugPrint('   register: document creation code Start');
    try {
      await collectionReference.doc(user.uid).set({  // <--------------code does not run, even though line above prints 
        'profileImageUrl': 'https://firebasestorage.googleapis.com/v0/b/commentaries-d82cd.appspot.com/o/defaultProfileImage.png?alt=media&token=07e4d649-3da7-4f9f-8cf9-062ac9cc9507',
        'userID': user.uid,
        'accountCreated': DateTime.now(),
        'email': user.email,
        'userName': userName,
        'firstName': firstName,
        'lastName': lastName,
      });
      debugPrint('   register: Document Created');
      return true;
    } catch (e) {
      debugPrint('   register: Document Error');
      return false;
    }
  } catch (e) {
    debugPrint('>> register: Create User Error');
    return false;
  }
}

Future<bool> signOut() async {
  // ignore: unused_local_variable, await_only_futures
  User user = await auth.currentUser!;
  await auth.signOut();
  return Future.value(true);
}

//  SECOND PRESS GENERATED THE DOCUMENT
// THIS MUST BE BECAUSE YOU CAN'T WRITE TO THE DATABASE UNLESS THERE IS A RECOGNIZED USER
// USER IS RECOGNIZED AFTER ACCOUNT REGISRATION 
// THEN THE DOCUMENT CODE RAN CORRECTLY

// Future<void> signUp(String email, String password, String firstName,
//     String lastName, String userName) async {
//   try {
//     // ignore: unused_local_variable
//     UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password); // <-- user account is created on first press
//     debugPrint('>> Authentication: registered user'); // user should automatically be signed in here
//     // await user.reload();
//     // debugPrint('>> Authentication: user reloaded');
//   } catch (e) {
//     debugPrint('>> Authentication: create new user error');
//   }
//   user = auth.currentUser!;
//   debugPrint('>> Authentication: current user got');
//   String userID = user.uid;
//   debugPrint('>> Authentication: user.id = $userID');
//   debugPrint('>> Authentication: email = $email');
//   debugPrint('>> Authentication: firstName = $firstName');
//   debugPrint('>> Authentication: lastName = $lastName');
//   debugPrint('>> Authentication: userName = $userName'); // all debugs print out correctly here, even userID
  
//   debugPrint('>> Authentication: document creation code Start');
//   await collectionReference.doc(userID).set({
//     // code does not run
//     'profileImageUrl': 'https://firebasestorage.googleapis.com/v0/b/commentaries-d82cd.appspot.com/o/defaultProfileImage.png?alt=media&token=07e4d649-3da7-4f9f-8cf9-062ac9cc9507',
//     'userID': userID,
//     'accountCreated': DateTime.now(),
//     'email': email,
//     'userName': userName,
//     'firstName': firstName,
//     'lastName': lastName,
//   });
//   debugPrint('>> Authentication: User Document Created');
// }