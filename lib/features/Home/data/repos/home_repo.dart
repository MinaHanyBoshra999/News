import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:news/core/errors/failure.dart';
import 'package:news/core/services/api_services.dart';
import 'package:news/features/Home/data/models/news_model.dart';

class HomeRepo{

static Future<Either<Failure, List<NewsModel>>> get({required String topic})async{
  
  var response =await ApiServices.get(endPoint: 'everything?q=$topic');
  if(response.statusCode==200){
    List<NewsModel> newsList=[];
      var data= jsonDecode(response.body);
      for(var item in data['articles']){
        newsList.add(NewsModel.fromJson(item));
      }
    
      debugPrint('Successful Response $data');
      return right(newsList);
    }else{  
      debugPrint('There was an Error ::  ${response.statusCode}');
       return  left(ServerFailure.fromResponse(response.statusCode, ))  ;


    }
  

  



}
























}