import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart'; 
import 'package:path/path.dart'; 

class ImageModel {
  File? imageFile;

  //  imagem da câmera ou galeria
  Future<void> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
  }

  //       salvar a imagem em um diretório
  Future<String?> saveImage() async {
    if (imageFile != null) {
  
      final directory = await getApplicationDocumentsDirectory();
      
     
      String newPath = join(directory.path, 'saved_image_${DateTime.now().millisecondsSinceEpoch}.jpg');
      
      
      final savedImage = await imageFile!.copy(newPath);
      

      return savedImage.path;
    }
    return null;
  }
}
