import 'package:flutter/material.dart';
import 'package:webkul_interview/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
   var userData={};
     String ?username;
  String ?email;
  String ?profilephoto;
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
      profilephoto=userData['profilePhoto']!;
    });
  }catch(e){
     print(e.toString());
  }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
    
          
        child:Column(
          
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*.3,
            ),
             Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: '${profilephoto??" "}',
                                  height: 100,
                                  width: 100,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                  ),
                                ),
                              )
                            ],
                          ),
                           Text(username??" ",style: TextStyle(
              fontSize: 20,
            ),),
               Text(email??" ",style: TextStyle(
              fontSize: 20,
            ),),
                  ElevatedButton(
  style: ElevatedButton.styleFrom(elevation: 2),
  onPressed: ()=>authController.signOut(),
  child: Text('Sign out',style:  TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: .5
            
            ),),
),
          ],
        )
        
        
      ),
    );
  }
}