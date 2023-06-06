import 'package:cloud_firestore/cloud_firestore.dart';

class TicketBooking{
String customerName;
String customerEmail;
String coustomerId;
String age;
String phoneNO;
String moviename;
String  totalTIcket;
String slot;
final datePublished;
TicketBooking({
required this.customerName,
required this.customerEmail,
required this.coustomerId,
required this.phoneNO,
required this.moviename,
required this.totalTIcket,
required this.age,
required this.datePublished,
required this.slot,
});

Map<String,dynamic> toJson()=>{
"customerName":customerName,
"customerEmail":customerEmail,
"coustomerId":coustomerId,
"phoneNO":phoneNO,
"moviename":moviename,
"totalTIcket":totalTIcket,
"age":age,
"datePublished":datePublished,
"slot":slot,
};

static TicketBooking fromSnap(DocumentSnapshot snap){
  var snapshot= snap.data() as Map<String ,dynamic>;
  return TicketBooking(
    customerName:snapshot['customerName'] ,
     customerEmail: snapshot['customerEmail'],
      coustomerId: snapshot['coustomerId'],
       phoneNO: snapshot['phoneNO'],
      moviename: snapshot['moviename'],
        totalTIcket: snapshot['totalTIcket'],
         age: snapshot['age'], 
         datePublished: snapshot['datePublished'], 
         slot: snapshot['slot'],);
}

}