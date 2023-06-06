import 'package:flutter/material.dart';
import 'package:webkul_interview/views/Screen/bookticket.dart';
class MovieDetailsPage extends StatefulWidget {
  String moviename;
  final movieaverage;
  String movieoverview;
  String imageurl;
  String datereleased;
  MovieDetailsPage({
    super.key,
    required this.moviename,
    required this.movieoverview,
    required this.imageurl,
    required this.movieaverage,
    required this.datereleased,
    });

 String getname (){
  return this.moviename;
}
  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  String ? movie;
  @override
  Widget build(BuildContext context) {
    setState(() {
      movie= widget.moviename;
    });
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
        leading: IconButton(
  icon:  Icon(Icons.arrow_back, color: Colors.lightBlue),
  onPressed: () => Navigator.of(context).pop(),
), 
        title: Text("Movies Details"),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height:400 ,
              width: 400,
              child: Image.network(widget.imageurl),
            ),
            SizedBox(
              height: 10,
            ),
            Text(widget.moviename,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text('Date Released${ widget.datereleased}',style: TextStyle(
              fontSize: 15,
            
              
              ),),
              Text('Average Rating${ widget.movieaverage}',style: TextStyle(
              fontSize: 15,
            
              
              )),
            ],),
             SizedBox(
              height: 10,
            ),
            Text(widget.movieoverview,
            style:  TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: .5
              
              ),
            ),
         ElevatedButton(
        style: ElevatedButton.styleFrom(elevation: 2),
        onPressed: () { 
           Navigator.push(context, MaterialPageRoute(builder:(context)=>BookTicketPage(
                  moviename: movie!,
                
                
                )));
        },
        child: Text('Book Ticket',style:  TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: .5
              
              ),),
      )
      
          ],
        ),
      ),

      //  bottomNavigationBar: BottomNavigationBar(
        
      //  items: [
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.home, size: 30),
      //       label: 'Home',
      //     ),
         
      //  ],
     
      // ),
    );
  }
}