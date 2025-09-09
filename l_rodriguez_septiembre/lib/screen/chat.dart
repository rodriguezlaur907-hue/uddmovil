// screens/chats.dart
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back), // Ícono de menú
          title: const Text('Hoteles en Australia'), // Título de la AppBar
          actions: const [
            Icon(Icons.search), // Ícono de more_vert
          ],
        ),
        body: ListView(
          
          children: [
            
            Container(
              height: 50.0, // Altura de 570 píxeles
              width: double.infinity, // Ocupa todo el ancho disponible
              color: Colors.grey, // Color de fondo gris
              child: const Center(child: Text('Resumen          Hoteles          Cosas que hacer')), // Texto dentro del primer Container
              
            ),
            
            const SizedBox(height: 12.0), // Espacio de 12 píxeles entre los containers
            
            const SizedBox(height: 12.0), // Espacio de 12 píxeles entre los containers

            Container(
              height: 148.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      
                      color: Colors.orange, // Color de fondo naranja
                      //child: const Center(child: Text('Hello World!')),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: Colors.orange, // Color de fondo naranja
                    ),
                  ),
                  const SizedBox(width: 12.0),

                ],
              ),
              
            ),
            Container(
              height: 22.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 224, 177), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Greater new castle'),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 222, 173), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Greater new castle'),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  

                ],
              ),
              
            ),
            Container(
              height: 22.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 224, 177), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Nueva gales'),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 222, 173), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Victoria, Australia'),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  

                ],
              ),
              
            ),
             const SizedBox(height: 12.0), // Espacio de 12 píxeles entre los containers
            
            const SizedBox(height: 12.0), // Espacio de 12 píxeles entre los containers
             Container(
              height: 148.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      
                      color: Colors.orange, // Color de fondo naranja
                      //child: const Center(child: Text('Hello World!')),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: Colors.orange, // Color de fondo naranja
                    ),
                  ),
                  const SizedBox(width: 12.0),

                ],
              ),
              
            ),
            Container(
              height: 22.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 224, 177), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Greater new castle'),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 222, 173), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Greater new castle'),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  

                ],
              ),
              
            ),
            Container(
              height: 22.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 224, 177), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Nueva gales'),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 222, 173), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Victoria, Australia'),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  

                ],
              ),
              
            ),
             const SizedBox(height: 12.0), // Espacio de 12 píxeles entre los containers
            
            const SizedBox(height: 12.0), // Espacio de 12 píxeles entre los containers
             Container(
              height: 148.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      
                      color: Colors.orange, // Color de fondo naranja
                      //child: const Center(child: Text('Hello World!')),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: Colors.orange, // Color de fondo naranja
                    ),
                  ),
                  const SizedBox(width: 12.0),

                ],
              ),
              
            ),
            Container(
              height: 22.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 224, 177), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Greater new castle'),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 222, 173), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Greater new castle'),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  

                ],
              ),
              
            ),
            Container(
              height: 22.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 224, 177), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Nueva gales'),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 222, 173), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Victoria, Australia'),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  

                ],
              ),
              
            ),
             const SizedBox(height: 12.0), // Espacio de 12 píxeles entre los containers
            
            const SizedBox(height: 12.0), // Espacio de 12 píxeles entre los containers
             Container(
              height: 148.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      
                      color: Colors.orange, // Color de fondo naranja
                      //child: const Center(child: Text('Hello World!')),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: Colors.orange, // Color de fondo naranja
                    ),
                  ),
                  const SizedBox(width: 12.0),

                ],
              ),
              
            ),
            Container(
              height: 22.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 255, 224, 177), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Greater new castle'),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 255, 222, 173), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Greater new castle'),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  

                ],
              ),
              
            ),
            Container(
              height: 22.0, // Altura de 148 píxeles
              color: Colors.transparent, // Color de fondo transparente para la separación

              child: Row(

                children: [
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 224, 177), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Nueva gales'),
                    ),
                  ),
                  


                  const SizedBox(width: 12.0), // Espacio de 12 píxeles entre los containers
                  
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(0, 255, 222, 173), // Color de fondo naranja
                      height: 30.0,
                      child: const Text('Victoria, Australia'),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  

                ],
              ),
              
            ),
             const SizedBox(height: 12.0), // Espacio de 12 píxeles entre los containers
            
            const SizedBox(height: 12.0), // Espacio de 12 píxeles entre los containers

            




          ],
        ),
      ),
    );
  }
}
