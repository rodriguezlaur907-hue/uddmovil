import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RecetasScreen extends StatefulWidget {
  const RecetasScreen({super.key});

  @override
  State<RecetasScreen> createState() => _RecetasScreenState();
}

class _RecetasScreenState extends State<RecetasScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  File? _pickedImageFile;
  final _picker = ImagePicker();

  Future<void> _pickImage(StateSetter setDialogState) async {
    final pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedImage != null) {
      _pickedImageFile = File(pickedImage.path);
      setDialogState(() {});
    }
  }

  Future<String?> _uploadImage(File imageFile) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('recetas_images')
          .child('${DateTime.now().toIso8601String()}.jpg');

      await ref.putFile(imageFile);
      return await ref.getDownloadURL();

    } catch (e) {
      if (kDebugMode) print("Error al subir imagen: $e");
      return null;
    }
  }

  
  Future<void> _agregarReceta() async {
    final TextEditingController tituloController = TextEditingController();
    final TextEditingController descripcionController = TextEditingController();

    _pickedImageFile = null;

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Nueva Receta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => _pickImage(setDialogState),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      image: _pickedImageFile != null
                          ? DecorationImage(
                              image: FileImage(_pickedImageFile!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _pickedImageFile == null
                        ? const Center(
                            child: Icon(Icons.camera_alt, size: 40),
                          )
                        : null,
                  ),
                ),

                const SizedBox(height: 16),
                TextField(
                  controller: tituloController,
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descripcionController,
                  decoration: const InputDecoration(
                    labelText: 'Descripción',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (tituloController.text.isEmpty) return;

                  String? imageUrl;

                  if (_pickedImageFile != null) {
                    imageUrl = await _uploadImage(_pickedImageFile!);
                  }

                  try {
                    await _firestore.collection('recetas').add({
                      'titulo': tituloController.text,
                      'descripcion': descripcionController.text,
                      'fecha': FieldValue.serverTimestamp(),
                      'imagen': imageUrl,
                      'activo': true,
                    });

                    if (mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Receta guardada exitosamente'),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error al guardar: $e'),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                      );
                    }
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          );
        },
      ),
    );
  }

  //-------------------------------------------------------------------
  // ELIMINAR RECETA
  //-------------------------------------------------------------------
  Future<void> _eliminarReceta(String docId) async {
    try {
      await _firestore.collection('recetas').doc(docId).delete();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Receta eliminada'),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al eliminar: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  //-------------------------------------------------------------------
  // UI PRINCIPAL
  //-------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Recetas Médicas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('recetas')
                    .orderBy('fecha', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No hay recetas aún."));
                  }

                  return GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      final doc = snapshot.data!.docs[index];
                      final data = doc.data() as Map<String, dynamic>;

                      return recetaCard(
                        titulo: data['titulo'] ?? 'Sin título',
                        descripcion: data['descripcion'] ?? '',
                        imagenUrl: data['imagen'],
                        docId: doc.id,
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: _agregarReceta,
                child: const Text("Agregar Receta"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //-------------------------------------------------------------------
  // CARD DE RECETA CON IMAGEN
  //-------------------------------------------------------------------
  Widget recetaCard({
    required String titulo,
    required String descripcion,
    required String? imagenUrl,
    required String docId,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGEN
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200,
              image: imagenUrl != null
                  ? DecorationImage(
                      image: NetworkImage(imagenUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imagenUrl == null
                ? const Center(child: Icon(Icons.medical_information, size: 50))
                : null,
          ),

          const SizedBox(height: 10),

          Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          Text(
            descripcion,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const Spacer(),

          Align(
            alignment: Alignment.bottomRight,
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'eliminar',
                  child: Row(
                    children: const [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Eliminar'),
                    ],
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 'eliminar') {
                  _eliminarReceta(docId);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
