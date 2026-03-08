import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';

class MovieDetail extends StatelessWidget {
  final MovieModel data;
  const MovieDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kembali ke Home'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 16,
                children: [
                  Image.network(data.imgUrl, width: 150),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${data.title} (${data.year})',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ), // title
                        ListTile(
                          title: Row(
                            spacing: 4,
                            children: [
                              Icon(Icons.star, color: Colors.amberAccent),
                              Text('${data.rating}'),
                            ],
                          ),
                          subtitle: Text(
                            'Genre: ${data.genre}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        SizedBox(height: 8),
                        Text(
                          'Cast:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          data.casts.join(' - '),
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'Directed by: ${data.director}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Sipnosis',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
  Divider(),
              Text(
                data.synopsis,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
