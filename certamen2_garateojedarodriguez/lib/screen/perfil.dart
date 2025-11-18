import 'package:flutter/material.dart';
import 'package:certamen2_garateojedarodriguez/screen/recetas.dart';


class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 50),
            ),

            const SizedBox(height: 10),

            const Text(
              "Usuario",
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            buildOption("Información"),
            InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RecetasScreen()),
    );
  },
  child: buildOption("Recetas"),
),

            buildOption("Historial de pedidos"),
            buildOption("Favoritos"),

            const SizedBox(height: 30),

            TextButton(
              onPressed: () {},
              child: const Text(
                "Cerrar sesión",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOption(String text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: double.infinity,
          child: Text(text),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
