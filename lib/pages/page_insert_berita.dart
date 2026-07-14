import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class PageInsertBerita extends StatefulWidget {
  const PageInsertBerita({super.key});

  @override
  State<PageInsertBerita> createState() => _PageInsertBeritaState();
}

class _PageInsertBeritaState extends State<PageInsertBerita> {
  TextEditingController judulController = TextEditingController();
  TextEditingController isiController = TextEditingController();

  File? _fileGambar;
  final _imgPicker = ImagePicker();

  //fungsi mengambil gambar ImagePicker
  Future<void> _getImage(ImageSource source) async{
    try{
      final XFile? _ambilGambar = await _imgPicker.pickImage(source: source);
      if(_ambilGambar!=null){
        setState(() {
          _fileGambar = File(_ambilGambar.path);
        });
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()))
      );
    }
  }

  //fungsi untuk pilihan gambar
  void _pilihGambar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext contex) {
        return AlertDialog(
          title: Text("Pilih Gambar"),
          content: Text("Plih Sumber Gambar"),
          actions: [
            ElevatedButton(onPressed: () {_getImage(ImageSource.gallery);}, child: Text("Galeri")),
            ElevatedButton(onPressed: () {_getImage(ImageSource.camera);}, child: Text("Camera")),
          ],
        );
      },
    );
  }

  String _message = "";
  bool _isloading = false;

  //Future<String> _insertBerita() async {
    //try{
     // _isloading = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Berita"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(

          child: Column(
            children: [
              TextFormField(
                controller: judulController,
                decoration: InputDecoration(labelText: "Judul Berita"),
                validator: (value) {
                  return value!.isEmpty ? "Judul tidak boleh kosong" : null;
                },
              ),
              TextFormField(
                controller: isiController,
                decoration: InputDecoration(labelText: "Isi Berita"),
                validator: (value) {
                  return value!.isEmpty ? "Isi tidak boleh kosong" : null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _pilihGambar(context);
                },
                child: Text("Pilih Gambar"),
              ),
              _fileGambar != null ? Image.file(_fileGambar!, width: double.infinity, height: 300,fit: BoxFit.cover,)

            ],
          ),
        ),
      ),
    );
  }
}