import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ventanas_prpyecto/models/recetas.dart';

class ProviderApp extends ChangeNotifier{

  final String _domain = 'pokeapi.co';

  List<Recetas> recetaList = [];

  ProviderApp(){
    getAllRecetas();
  }

  getAllRecetas() async {
    
    Uri url = Uri.https("recetas-api.onrender.com", '/api/recetas/');

    final response = await http.get(url);

    List<Recetas> data = List<Recetas>.from(json.decode(response.body));

    recetaList = [...recetaList, ...data];

    notifyListeners();
  }

  
}