import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../model/NewsResponse.dart';


class NewsWidgetViewModel extends ChangeNotifier{
  List<News>? newsList ;
  String? errorMessage ;
  void getNewsBySourceId(String sourceId)async {
    newsList = null ;
    errorMessage = null ;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if(response?.status == 'error'){
        errorMessage = response!.message;
      }else{
        newsList = response!.articles ;
      }
    }catch(e){
      errorMessage = 'Error Loading News List.';
    }
    notifyListeners();
  }
}