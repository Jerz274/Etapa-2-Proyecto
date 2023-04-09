import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  void _loadRecipes() async {
    setState(() {
      _recipes = [
        Recipe(
          title: 'Tarta de manzana',
          description: 'Una deliciosa tarta de manzana casera',
          image: 'assets/tarta.jpg',
        ),
        Recipe(
          title: 'Pasta con salsa de tomate',
          description: 'Una receta clásica de pasta con salsa de tomate',
          image: 'assets/pasta.jpg',
        ),
        Recipe(
          title: 'Ensalada César',
          description: 'Una fresca ensalada César con pollo y croutons',
          image: 'assets/cesar.jpg',
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Cambio del color de fondo de la AppBar
        title: Text(
          'Buscar recetas',
          style: TextStyle(
            color: Colors.black, // Cambio del color del texto del título
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, // Cambio del color de la flecha de retroceso
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar receta',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                setState(() {
                  _recipes = _recipes
                      .where((recipe) => recipe.title
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                      .toList();
                });
              },
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  final recipe = _recipes[index];
                  return RecipeCard(
                    title: recipe.title,
                    description: recipe.description,
                    image: recipe.image,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Recipe {
  final String title;
  final String description;
  final String image;

  Recipe({
    required this.title,
    required this.description,
    required this.image,
  });
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  RecipeCard({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navegar a la pantalla de detalles de la receta
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: 150.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
