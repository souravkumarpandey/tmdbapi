// COLORS
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:webkul_interview/controller/auth_controller.dart';
import 'package:webkul_interview/views/Screen/feed.dart';
import 'package:webkul_interview/views/Screen/profile.dart';

import 'package:webkul_interview/views/Screen/search.dart';



List pages = [
   Feed(),
  SearchScreen(),
  Profile(),
  
];

const imageprefix ='https://image.tmdb.org/t/p/w500/';

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;