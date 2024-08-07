

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/core/errors/failure.dart';
import 'package:news/core/services/api_constants.dart';


class ApiServices{

static   get({required String endPoint,})async{
    Uri url=Uri.parse("${ApiConstants.baseUrl}$endPoint&apiKey=${ApiConstants.apiKey}");

    http.Response response=await http.get(url);
    return response;
    



  }
  








}