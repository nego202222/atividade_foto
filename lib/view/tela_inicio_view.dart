import 'dart:io';
import 'package:atividade_foto/controller/imagem_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() => runApp(const TelaInicial());

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final ImageController imageController = ImageController(); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Salvamento de Foto'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageController.imageFile != null
                  ? Image.file(imageController.imageFile!)
                  : Image.asset('assets/images/meme.webp'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          await imageController.pickImage(ImageSource.camera); 
                          setState(() {}); 
                        },
                        child: const Text('Abrir Câmera'),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          await imageController.pickImage(ImageSource.gallery); 
                          setState(() {}); 
                        },
                        child: const Text('Escolher da Galeria'),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          String? savedPath = await imageController.saveImage(); 
                          if (savedPath != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Imagem salva em: $savedPath')),
                            );
                          }
                        },
                        child: const Text('Salvar Imagem'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
