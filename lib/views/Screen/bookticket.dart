


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:webkul_interview/constant.dart';
import 'package:webkul_interview/controller/uploadTicketController.dart';
import 'package:webkul_interview/views/Screen/moviesdetails.dart';

import 'package:webkul_interview/views/widget/text_input.dart';
enum slotTimimg{
A,B,C
}
class BookTicketPage extends StatefulWidget {
  String moviename;
   BookTicketPage({super.key,required this.moviename});

  @override
  State<BookTicketPage> createState() => _BookTicketPageState();
}
String? slot;
double? _height;
  double? _width;
  String ? _setDate;
int _value = 1;
 

  String ?dateTime;

  DateTime selectedDate = DateTime.now();
  



class _BookTicketPageState extends State<BookTicketPage> {
 
  final TextEditingController _agecontroller = TextEditingController();
final TextEditingController _seatcontroller = TextEditingController();
final TextEditingController _phoneNocontroller = TextEditingController();

TextEditingController _dateController = TextEditingController();
   UploadTicketController uploadTicketController= Get.put(UploadTicketController());
   slotTimimg _value =slotTimimg.A;
  var userData={};
  String ?username;
  String ?email;
  String ?uidd;
  
  
@override
 void initState(){
 super.initState();
 getData();
 }
 getData() async{
  try{
   var snap=await firestore.collection('users').doc(firebaseAuth.currentUser!.uid).get();
    userData=snap.data()!;
    print(userData);
    setState(() {
      username=userData['name']!;
      email=userData['email']!;
      uidd=userData['uid']!;
    });
  }catch(e){
     print(e.toString());
  }
 }
  
  Future<Null> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101));
  if (picked != null){
    setState(() {
        selectedDate = picked;
      _dateController.text = DateFormat.yMd().format(selectedDate);
    });
  }
    
}

  @override
  Widget build(BuildContext context) {
     _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.black,
        leading: IconButton(
  icon:  Icon(Icons.arrow_back, color: Colors.lightBlue),
  onPressed: () => Navigator.of(context).pop(),
), 
        title: Text("Grab Your Seat"),
      ),
      body: Container(
        
        padding: EdgeInsets.only(left: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
          children: [
             SizedBox(
              height: 15,
            ),
            Text(username??" ",style: TextStyle(
              fontSize: 20,
            ),),
             SizedBox(
              height: 15,
            ),
            Text(email??" ",style: TextStyle(
              fontSize: 20,
            ),),
             SizedBox(
              height: 15,
            ),
            Text(widget.moviename,style :TextStyle(
              fontSize: 20,
            ),),
             SizedBox(
              height: 15,
            ),
            Text(firebaseAuth.currentUser!.uid,style :TextStyle(
              fontSize: 20,
            ),),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
          Container(
              width: MediaQuery.of(context).size.width*.35,
              margin: const EdgeInsets.only(left: 5,right: 5),
              child: TextInputField(
                controller: _agecontroller,
                labelText: 'Age',
                icon: Icons.person,
                
                 
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*.35,
              margin: const EdgeInsets.only(left: 5,right: 5),
              child: TextInputField(
                controller: _seatcontroller,
                labelText: 'Seat',
                icon: Icons.person,
                
                 
              ),
            ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width*.35,
              margin: const EdgeInsets.only(left: 5,right: 5),
              child: TextInputField(
                controller: _phoneNocontroller,
                labelText: 'Phone No.',
                icon: Icons.phone,
                
                 
              ),
            )
            ,
             SizedBox(
              height: 15,
            ),
            
            Text("Choose Slot Timing",style: TextStyle(fontSize:20,),),
           
           Column(
          children: [
            RadioListTile(
              title: Text("6:00-9:00"),
              value: slotTimimg.A,
              groupValue:_value,
              onChanged:(slotTimimg? val){
               setState(() {
                  _value=val!;
               });
              },
            ),
            RadioListTile(
              title: Text("10:00-13:00"),
              value: slotTimimg.B,
              groupValue:_value,
              onChanged:(slotTimimg? val){
               setState(() {
                 _value=val!;
               });
              },
            ),
            RadioListTile(
              title: Text("15:00-18:00"),
              value: slotTimimg.C,
              groupValue:_value,
              onChanged:(slotTimimg? val){
               setState(() {
                  _value=val!;
               });
              },
            ),
          ],
              ),
          Text("Choose Date",style: TextStyle(fontSize:20,),),
             Row(
              children: [
           InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      width:100 ,
                      height:50 ,
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.grey.shade400),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20,color: Colors.black),
                        textAlign: TextAlign.center,
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _dateController,
                        onSaved: (val) {
                          _setDate = val;
                        },
                        decoration: InputDecoration(
                            disabledBorder:
                                UnderlineInputBorder(borderSide: BorderSide.none),
                            // labelText: 'Time',
                            contentPadding: EdgeInsets.only(top: 0.0)),
                      ),
                    ),
                  ),
              ],
             ),
             SizedBox(
              height: 15,
             ),
             ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 2),
          onPressed: ()=>uploadTicketController.uploadTicket(_agecontroller.text, _phoneNocontroller.text,widget.moviename, _seatcontroller.text,_value.toString(),_dateController.text),
          child: Text('Confirm Book Ticket',style:  TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: .5
              
              ),),)
          ],
          
          ),
        ),

      ),
      

    );
  }
}
