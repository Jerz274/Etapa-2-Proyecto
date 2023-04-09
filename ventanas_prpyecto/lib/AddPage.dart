import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Agregar Receta',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre de la receta',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Porfavor ingrese el nombre de la receta';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ingredientes',
                ),
                maxLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Porfavor ingrese los ingredientes';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Pasos',
                ),
                maxLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Porfavor ingrese los pasos de la receta';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Save the recipe
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Receta añadida')),
                    );
                  }
                },
                child: Text('Agregar Receta'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
