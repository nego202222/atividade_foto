import 'dart:io';

import 'package:atividade_foto/model/imagem_Model.dart';
import 'package:image_picker/image_picker.dart';



class ImageController {
  final ImageModel model = ImageModel();

  //capturar 
  Future<void> pickImage(ImageSource source) async {
    await model.pickImage(source);
  }

  //salvar
  Future<String?> saveImage() async {
    return await model.saveImage();
  }


  File? get imageFile => model.imageFile;
}
