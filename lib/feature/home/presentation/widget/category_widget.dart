import 'package:flutter/material.dart';
import 'package:movie_ui/core/route/app_route_name.dart';
import 'package:movie_ui/feature/home/model/movie_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key});

  final List<String> categories = const [
    "Horror",
    "Action",
    "Animation",
    "Music",
    "Drama"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          categories.length,
          (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieCategoryScreen(
                        category: categories[index], movies: nowPlayingMovie),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    color: const Color(0xFFE8B448),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Text(
                  categories[index],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MovieCategoryScreen extends StatelessWidget {
  final String category;
  final List<Movie> movies;

  const MovieCategoryScreen({
    Key? key,
    required this.category,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // กรองรายการหนังตามประเภท
    List<Movie> categoryMovies =
        movies.where((movie) => movie.type == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // กำหนดจำนวนคอลัมน์ในแถว
          crossAxisSpacing: 8.0, // กำหนดระยะห่างระหว่างคอลัมน์
          mainAxisSpacing: 8.0, // กำหนดระยะห่างระหว่างแถว
        ),
        itemCount: categoryMovies.length,
        itemBuilder: (context, index) {
          final movie = categoryMovies[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouteName.movieDetail,
                arguments: movie,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    movie.assetImage,
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
