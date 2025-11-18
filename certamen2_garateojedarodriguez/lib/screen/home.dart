import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              buildProductCarousel(context),
              const SizedBox(height: 20),
              buildIndicators(context),

              const SizedBox(height: 24),

              buildSubtitle(context, "Subtitle 2"),
              const SizedBox(height: 12),
              buildProductCarousel(context),
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

  Widget buildProductCarousel(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => productCard(context),
      ),
    );
  }

  Widget productCard(BuildContext context) {
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
            spreadRadius: 2,
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
                    Icons.favorite_border,
                    size: 18,
                    color: Theme.of(context).colorScheme.primary, 
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          const Text(
            "Primer Item",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("\$1000", style: TextStyle(fontSize: 14)),

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