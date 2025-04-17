import 'package:conversor_de_moedas/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?key=86a6a079";

void main() async {
  
  
 

  runApp(MaterialApp(home: HomePage()));
}

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));

  return json.decode(response.body);
}