import 'package:flutter/material.dart';
import 'package:cisnerosvarios/transform_0453.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cisneros 0453",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue, // Color de fondo del AppBar
          title: const Text(
            "Tienda de Ropa 0453",
            style: TextStyle(color: Colors.white), // Color del texto
          ),
          actions: [
            IconButton(
              icon:
                  Icon(Icons.shopping_cart), // Icono para el carrito de compras
              onPressed: () {
                // Implementa la lógica para abrir el carrito de compras
              },
            ),
          ],
        ),
        body: const TransformPageView(),
      ),
    );
  }
}
