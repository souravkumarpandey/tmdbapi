import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webkul_interview/models/user.dart' as model;
import 'package:webkul_interview/views/auth/login_Screen.dart';

import '../constant.dart';
import '../views/Screen/homescreen.dart';

class AuthController extends GetxController{
  static AuthController instance= Get.find();
  late Rx<File?> _pickedImage;
  late Rx<User?> _user;
  File? get profilePhoto => _pickedImage.value;
 User get user => _user.value!;

 void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }
   _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }
 // upload image to firestore
  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }
 Future<String> _uploadToStorage(File image) async{
 Reference ref= firebaseStorage.ref().child('profilePics').child(firebaseAuth.currentUser!.uid);

 UploadTask uploadTask=ref.putFile(image);
 TaskSnapshot snap=await uploadTask;

 String dowloadUrl= await snap.ref.getDownloadURL();
 return dowloadUrl;

 }

  //registring the user
  void registringUser(String username,String email, String password,File? image)async{
    try{
         if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image !=null){
          // save user to our aut firebase firestore
          UserCredential cred= await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
         String downloadUrl=await _uploadToStorage(image);
          model.User user= model.User(name: username, email: email, profilePhoto: downloadUrl, uid: cred.user!.uid);
          await firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
         }else{
           Get.snackbar("Eror in creating and accout", "Please enter all the field");
         }
    }catch(e){
      Get.snackbar("Eror in creating and accout", "error");
    }
  }
  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Loggin gin',
        e.toString(),
      );
    }
  }
   void signOut() async {
    await firebaseAuth.signOut();
  }
}