// To parse this JSON data, do
//
//     final recetas = recetasFromJson(jsonString);

import 'dart:convert';

List<Recetas> recetasFromJson(String str) => List<Recetas>.from(json.decode(str).map((x) => Recetas.fromJson(x)));

String recetasToJson(List<Recetas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recetas {
    int id;
    String name;
    String description;

    Recetas({
        required this.id,
        required this.name,
        required this.description,
    });

    factory Recetas.fromJson(Map<String, dynamic> json) => Recetas(
        id: json["id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
    };
}
