import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:webkul_interview/views/Screen/moviesdetails.dart';



class Feed extends StatefulWidget {
 
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {


  String ?stringresponse;
  Map ?mapResponse;
  Map ?dataResposnce;
  List ?listresponse;
  Future apicall() async{
    http.Response response;
    response= await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=7d79a0348d08945377e89a95cd670c5a&language=en-US&page=1'));
  if(response.statusCode==200){
      setState(() {
       // stringresponse=response.body;
        mapResponse=json.decode(response.body);
        listresponse=mapResponse!['results'];
      });
  }
  }

  @override
  void initState() {
    // TODO: implement initState
    apicall();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {

    return 
       Scaffold(
        appBar: AppBar(
          title: Text("Latest Movies"),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
         itemCount: listresponse==null?0:listresponse!.length,
          
          itemBuilder: (context,index){
          final details=listresponse![index];
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>MovieDetailsPage(
                  moviename: listresponse![index]['original_title'].toString(),
                  movieaverage:listresponse![index]['vote_average'],
                  movieoverview:listresponse![index]['overview'].toString(),
                  imageurl:'https://image.tmdb.org/t/p/w500/${listresponse![index]['poster_path'].toString()}',
                  datereleased:listresponse![index]['release_date'].toString(),
                
                )));
              },
              leading: Container(
                width: 100,
                height: 200,
                child:Image.network('https://image.tmdb.org/t/p/w500/${listresponse![index]['poster_path'].toString()}')),
                
              title: Text(listresponse![index]['original_title'].toString()),
            ),
          );
        })
       );
      // home:ChangeNotifierProvider(

      //   create: (context)=>MovieResultListViewModel(),
      //   child: MovieList(),
      // )
    
  }
}