import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/favorite_movie_model.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';
import 'package:latihan_kuis_a/screen/movie_detail.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});
  

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie List')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return buildCard(movieList[index], context);
        },
        itemCount: movieList.length,
      ),
    );
  }

  Widget buildCard(MovieModel data, BuildContext context) {
    String favMovie = '${data.title}-${data.director}-${data.genre}';

    return Card.filled(
      color: Colors.purple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(data.imgUrl, width: 40, height: 40),
          Expanded(
            child: ListTile(
              title: Text(
                '${data.title} (${data.year})',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: Text(
                "${data.director} | ${data.genre}",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              leading: Icon(Icons.star, color: Colors.yellow),
              title: Text(
                '${data.rating}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (favoriteMovies.contains(favMovie)) {
                  favoriteMovies.remove(favMovie);
                } else {
                  favoriteMovies.add(favMovie);
                }
              });
            },
            icon: Icon(
              favoriteMovies.contains(favMovie)
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: favoriteMovies.contains(favMovie)
                  ? Colors.red
                  : Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MovieDetail(data: data),
                ),
              );
            },
            child: Text("Detail"),
          ),
        ],
      ),
    );
  }
}
