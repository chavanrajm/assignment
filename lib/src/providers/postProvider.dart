import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier{
 List<dynamic> posts = [];
 bool isLoading = true;

 Future<void>getPosts()async{
   try{
     final response = await http.get(Uri.https('newsapi.org', '/v2/top-headlines', {
       'sources':'techcrunch','apiKey':'7ab5fcffc3ba440dba53ae38397ff7e4'
     }));

     if(response.statusCode == 200){

       posts.addAll(jsonDecode(response.body)['articles'] );
       isLoading = false;
       notifyListeners();
     }

   }catch(e){
     log(e.toString());
   }
 }


}