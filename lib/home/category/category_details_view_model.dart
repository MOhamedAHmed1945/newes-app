import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../model/SourceResponse.dart';


class CategoryDetailsViewModel extends ChangeNotifier{
 List<Source>? sourcesList ;
 String? errorMessage ;

 void getSources(String categoryId)async {
   sourcesList = null ;
   errorMessage = null ;
   notifyListeners();
   try {
     var response = await ApiManager.getSources(categoryId);
     if(response?.status == 'error'){
       errorMessage = response!.message ;
     }else{
       sourcesList = response!.sources ;
     }
   }catch(e){
     errorMessage = 'Error Loading Sources List.';
   }
   notifyListeners();
 }
}