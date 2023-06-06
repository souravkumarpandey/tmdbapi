import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webkul_interview/constant.dart';
import 'package:webkul_interview/models/tiketBooking.dart';

class UploadTicketController extends GetxController {
  //
  uploadTicket (
   
    String age,
    String phoneNO,
    String moviename,
    String totalTIcket,
    String slot,
    final datePublished,
  ) async{
    try {
        String uid= firebaseAuth.currentUser!.uid;
        DocumentSnapshot userDoc= await firestore.collection('users').doc(uid).get();
        var allDOcs=await firestore.collection('ticket').get();
        int len=allDOcs.docs.length;
      
    
      TicketBooking ticketBooking = TicketBooking(
        customerName: (userDoc.data()! as Map<String,dynamic>)['name'],
        customerEmail:  (userDoc.data()! as Map<String,dynamic>)['email'],
        coustomerId: uid,
        phoneNO: phoneNO,
        moviename: moviename,
        totalTIcket: totalTIcket,
        age: age,
        datePublished: datePublished,
        slot: slot,
      );
      await firestore.collection('ticket').doc('ticket${len}').set(ticketBooking.toJson());
      Get.snackbar('Ticket Book Successfully','check your email');
      
     
    } catch (e) {
      Get.snackbar('Error uploading Video', e.toString(),);
    }
  }
}
