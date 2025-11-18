import 'package:flutter/material.dart';

class NotificacionesScreen extends StatelessWidget {
  const NotificacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notificaciones",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _fecha("01 ene, 2025"),
              _notificacionCard(
                "https://via.placeholder.com/80x80.png?text=Img1",
                "Promoción item",
              ),
              const SizedBox(height: 20),
              _fecha("01 ene, 2025"),
              _notificacionCard(
                "https://via.placeholder.com/80x80.png?text=Img2",
                "Promoción item",
              ),
              const SizedBox(height: 20),
              _fecha("01 ene, 2025"),
              _notificacionCard(
                "https://via.placeholder.com/80x80.png?text=Img3",
                "Llegó stock",
              ),
              const SizedBox(height: 20),
              _fecha("01 ene, 2025"),
              _notificacionTextOnly(
                "Promociones invierno. Descubre productos en descuento",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fecha(String fecha) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        fecha,
        style: const TextStyle(
          color: Color(0xFF7DA7A4),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _notificacionCard(String imageUrl, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _notificacionTextOnly(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}