import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> _toggleFavorito({
    required String productoId,
    required String titulo,
    required String precio,
    String? imagenUrl,
    required bool isFavorito,
  }) async {
    try {
      if (isFavorito) {

        final querySnapshot = await _firestore
            .collection('favoritos')
            .where('productoId', isEqualTo: productoId)
            .get();

        for (var doc in querySnapshot.docs) {
          await doc.reference.delete();
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Eliminado de favoritos'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      } else {

        await _firestore.collection('favoritos').add({
          'productoId': productoId,
          'titulo': titulo,
          'precio': precio,
          'imagen': imagenUrl,
          'fechaAgregado': FieldValue.serverTimestamp(),
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Agregado a favoritos'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              duration: const Duration(seconds: 1),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }


  Stream<bool> _isFavoritoStream(String productoId) {
    return _firestore
        .collection('favoritos')
        .where('productoId', isEqualTo: productoId)
        .snapshots()
        .map((snapshot) => snapshot.docs.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Home page"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ofertas",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Text("Call to action"),
              ),
              const SizedBox(height: 24),
              buildSubtitle(context, "Subtitle 1"),
              const SizedBox(height: 12),
              buildProductCarousel(context, "categoria1"),
              const SizedBox(height: 20),
              buildIndicators(context),
              const SizedBox(height: 24),
              buildSubtitle(context, "Subtitle 2"),
              const SizedBox(height: 12),
              buildProductCarousel(context, "categoria2"),
              const SizedBox(height: 20),
              buildIndicators(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSubtitle(BuildContext context, String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }

  Widget buildProductCarousel(BuildContext context, String categoria) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {

          final productoId = '$categoria-producto-$index';
          return productCard(
            context,
            productoId: productoId,
            titulo: 'Producto ${index + 1}',
            precio: '\$${(index + 1) * 1000}',
            imagenUrl: null,
          );
        },
      ),
    );
  }

  Widget productCard(
    BuildContext context, {
    required String productoId,
    required String titulo,
    required String precio,
    String? imagenUrl,
  }) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(0, 4),
            color: Color.fromARGB(40, 0, 0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text("Img"),
              ),
              
              Positioned(
                bottom: 4,
                right: 4,
                child: StreamBuilder<bool>(
                  stream: _isFavoritoStream(productoId),
                  builder: (context, snapshot) {
                    final isFavorito = snapshot.data ?? false;

                    return GestureDetector(
                      onTap: () => _toggleFavorito(
                        productoId: productoId,
                        titulo: titulo,
                        precio: precio,
                        imagenUrl: imagenUrl,
                        isFavorito: isFavorito,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          isFavorito ? Icons.favorite : Icons.favorite_border,
                          size: 18,
                          color: isFavorito
                              ?Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(precio, style: const TextStyle(fontSize: 14)),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Ver más",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicators(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dot(context, isActive: true),
        _dot(context),
        _dot(context),
      ],
    );
  }

  Widget _dot(BuildContext context, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.shade400,
        shape: BoxShape.circle,
      ),
    );
  }
}