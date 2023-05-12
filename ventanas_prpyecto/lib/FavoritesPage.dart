import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventanas_prpyecto/provider.dart';


class FavoritesPage extends StatefulWidget {
  @override
  _RecetasFavoritasScreenState createState() => _RecetasFavoritasScreenState();
}

class _RecetasFavoritasScreenState extends State<FavoritesPage> {
  List<String> recetasFavoritas = [    'Pizza Margherita',    'Hamburguesa con queso',    'Ensalada César',    'Pollo a la parrilla',    'Sushi',    'Tacos de pescado',    'Pastel de chocolate',  ];
  

    

  

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderApp>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Recetas Favoritas',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: provider.recetaList.map((e) => Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Image.asset(
                'assets/libro.png',
                height: 50.0,
              ),
              title: Text(
                e.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Tiempo de preparación: 30 minutos'),
              trailing: Icon(Icons.favorite, color: Colors.red),
              onTap: () {
                // Lógica para abrir la pantalla de detalle de la receta
              },
            ),
          )).toList()
      )
    );
  }
}
