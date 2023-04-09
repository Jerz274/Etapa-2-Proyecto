import 'package:flutter/material.dart';

class EditarRecetaScreen extends StatefulWidget {
  @override
  _EditarRecetaScreenState createState() => _EditarRecetaScreenState();
}

class _EditarRecetaScreenState extends State<EditarRecetaScreen> {
  final TextEditingController _nombreRecetaController =
      TextEditingController();
  final TextEditingController _pasosRecetaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Editar Receta',
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
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.0),
            Text(
              'Nombre de la receta',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _nombreRecetaController,
              decoration: InputDecoration(
                hintText: 'Ingrese el nombre de la receta',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Pasos de preparación de la receta',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _pasosRecetaController,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Ingrese los pasos para preparar la receta',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para guardar los cambios realizados
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Cambios realizados')),
                );
              },
              child: Text('Guardar cambios'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
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

