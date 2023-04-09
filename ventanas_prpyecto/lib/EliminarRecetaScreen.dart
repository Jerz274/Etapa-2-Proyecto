import 'package:flutter/material.dart';

class EliminarRecetaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Eliminar Receta',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            Image.asset(
              'assets/libro.png',
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.0),
            Text(
              '¿Está seguro que desea eliminar esta receta?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Al eliminar la receta, no podrá recuperarla. Esta acción no se puede deshacer.',
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para eliminar la receta
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Receta eliminada')),
                );
              },
              child: Text('Eliminar receta'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
