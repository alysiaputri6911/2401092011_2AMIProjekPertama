import 'package:flutter/material.dart';

import '../models/model_berita.dart';


class DetailBerita extends StatelessWidget {

  final Datum berita;

  const DetailBerita({
    super.key,
    required this.berita,
  });

  @override
  Widget build(BuildContext context) {

    final String imageUrl =
        "http://10.20.27.157/berita_api/gambar/${berita.gambarBerita}";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Berita"),
        backgroundColor: Colors.lightBlue,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // GAMBAR BERITA
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              webHtmlElementStrategy: WebHtmlElementStrategy.prefer,

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
                );
              },

              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return SizedBox(
                  height: 250,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),

            // ISI DETAIL
            Padding(

              padding: const EdgeInsets.all(18),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(

                    berita.judul.toString(),

                    style: const TextStyle(

                      fontSize: 26,

                      fontWeight: FontWeight.bold,

                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(

                    children: [

                      const Icon(
                        Icons.calendar_month,
                        color: Colors.lightBlue,
                      ),

                      const SizedBox(width: 8),

                      Text(

                        berita.tglBerita.toString(),

                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const Text(

                    "Isi Berita",

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(

                    berita.isiBerita.toString(),

                    textAlign: TextAlign.justify,

                    style: const TextStyle(

                      fontSize: 17,

                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}