import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:webkul_interview/views/Screen/moviesdetails.dart';

class SearchScreen extends StatefulWidget {
   SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller= TextEditingController();

  String ?searchkeywork;
String ?stringresponse;
  Map ?mapResponse;
  Map ?dataResposnce;
  List ?listresponse;
  Future _apicall(String keyword)async{
    http.Response response;
    response= await http.get(Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=7d79a0348d08945377e89a95cd670c5a&language=en-US&query=${keyword}&page=1'));
  if(response.statusCode==200){
      setState(() {
       // stringresponse=response.body;
        mapResponse=json.decode(response.body);
        listresponse=mapResponse!['results'];
      });
  }
  }

  @override
  Widget build(BuildContext context) {
    
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: TextField(
              controller: controller,
              onSubmitted: (value){
                  _apicall(value);
              },
              decoration:  InputDecoration(
                labelText: 'Enter the search Term',
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                 
                  onPressed: () => {
	controller.clear()
  }
               ,
                 icon: Icon(Icons.clear)),
              ),
              
            ),
          ),

          body:  ListView.builder(
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
        }),
          
        );
      }
}