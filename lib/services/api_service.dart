import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mi2a_project_pertama/models/model_berita.dart';
import 'package:mi2a_project_pertama/models/model_photos.dart';


class ApiService {
  static const String urlPhotos = "https://jsonplaceholder.typicode.com/photos";
  static const String urlUser = "https://jsonplaceholder.typicode.com/users";

  static const String BaseUrl = "http://10.20.27.157/berita_api";
  static const String urlGambarBerita = "$BaseUrl/gambar/";
  static const String urlGetBerita = "$BaseUrl/getBerita.php";

  //register
  static const String urlRegister = "http://10.20.27.157/berita_api/register.php";
  static const String urlLogin = "http://10.20.27.157/berita_api/login.php";

  static Future<List<ModelPhotos>> fetchDataPhotos() async {
    final response = await http.get(Uri.parse(urlPhotos));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.take(50).map((e) => ModelPhotos.fromJson(e)).toList();
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  static Future<List<Datum>> getDataBerita() async {

    final response = await http.get(
      Uri.parse(urlGetBerita),
    );

    if (response.statusCode == 200) {

      final jsonData =
      json.decode(response.body);

      List data = jsonData['data'];

      return data.map((e) =>
          Datum.fromJson(e)).toList();

    } else {

      throw Exception(
        "Gagal mengambil data",
      );
    }
  }
}