import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileService {

  Future<String> getLocalPath() async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> getLocalFile(String fileName) async {
    final path = await getLocalPath();
    return File("$path/$fileName");
  }

  Future<File> writeDataToFile(String fileName, String contents) async{
    final file = await getLocalFile(fileName);
    return file.writeAsString(contents);
  }

  Future<String> readDataFromFile(String fileName) async{
    try{
      final file = await getLocalFile(fileName);
      final data = await file.readAsString();
      return data;
    }catch(error){
      print("File Not found $error");
    }
    return "";
  }
}