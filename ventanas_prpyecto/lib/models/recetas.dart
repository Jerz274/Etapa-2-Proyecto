// To parse this JSON data, do
//
//     final listaReceta = listaRecetaFromJson(jsonString);

import 'dart:convert';

List<ListaReceta> listaRecetaFromJson(String str) => List<ListaReceta>.from(json.decode(str).map((x) => ListaReceta.fromJson(x)));

String listaRecetaToJson(List<ListaReceta> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListaReceta {
    int id;
    String name;
    String description;

    ListaReceta({
        required this.id,
        required this.name,
        required this.description,
    });

    factory ListaReceta.fromJson(Map<String, dynamic> json) => ListaReceta(
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
