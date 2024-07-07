import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import 'api_constatnts.dart';
class ApiManager{

// https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
// 500c5a4f9b244f3db92a47f436f1819e

 static Future<SourceResponse?> getSources(String categoryId)async{
   Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourcesApi,
   {
     'apiKey' : '500c5a4f9b244f3db92a47f436f1819e',
     'category' : categoryId
   });
   try{
     var response = await http.get(url);
     var responseBody = response.body ;
     var json = jsonDecode(responseBody);
     return SourceResponse.fromJson(json);
   }catch(e){
     throw e ;
   }

 }

 //https://newsapi.org/v2/everything?apiKey=500c5a4f9b244f3db92a47f436f1819e

 static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
   Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
     'apiKey' : '500c5a4f9b244f3db92a47f436f1819e',
     'sources' : sourceId
   });
   try{
     var response = await http.get(url);
     var responseBody = response.body ;
     var json = jsonDecode(responseBody);
     return NewsResponse.fromJson(json);
   }catch(e){
     throw e ;
   }


 }
}