import 'package:flutter/material.dart';
import 'package:flutter_act13_20220252/modelo/model_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador',
      debugShowCheckedModeBanner: false,
      home: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  static List<MovieModel> mainMovieList = [
    MovieModel("Alicia en el País de las Maravillas", 2010, 9.5,
        "https://static.wikia.nocookie.net/doblaje/images/b/bf/Poster_Alicia.jpg/revision/latest?cb=20200727012545&path-prefix=es"),
    MovieModel("Miss Peregrine y los Niños Peculiares", 2016, 9.1,
        "https://musicart.xboxlive.com/7/78683900-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080"),
    MovieModel("Kimetsu no Yaiba: Entrenamiento de los pilares", 2024, 9.3,
        "https://a.storyblok.com/f/178900/849x1200/84616d7a3a/demon-slayer-hashira-training-world-tour-key-visual-vertical.jpg/m/filters:quality(95)format(webp)"),
    MovieModel("Five Nights at Freddys", 2023, 9.3,
        "https://es.web.img3.acsta.net/pictures/23/09/20/15/05/0470801.jpg"),
    MovieModel("Joven Manos de Tijeras", 1990, 9.5,
        "https://mx.web.img2.acsta.net/pictures/17/08/14/20/17/217767.jpg"),
    MovieModel("Smiley", 2022, 9.0,
        "https://pics.filmaffinity.com/Smiley_Miniserie_de_TV-300913022-large.jpg"),
    MovieModel("Elite", 2018 - 2024, 9.4,
        "https://m.media-amazon.com/images/M/MV5BYmU5N2YzYjQtM2Q4Yi00NWY4LWI5NDQtMzE4OTlhY2Q5NmJlXkEyXkFqcGdeQXVyMTMxNjUyMDkx._V1_.jpg"),
    MovieModel("El Secreto de la Calabaza Magica", 2007, 9.7,
        "https://th.bing.com/th/id/OIP.YiKIVAkrYCasIqmFweKhMwHaKk?w=115&h=180&c=7&r=0&o=5&pid=1.7s"),
  ];

  List<MovieModel> displayList = List.from(mainMovieList);

  void updateList(String value) {
    setState(() {
      displayList = mainMovieList
          .where((element) =>
              element.movieTitle!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 175, 56),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 213, 255, 87),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buscador de películas',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1f1545),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: displayList.length == 0
                  ? Center(
                      child: Text(
                        "No Hay Resultados",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          displayList[index].movieTitle!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${displayList[index].releaseYear!}',
                          style: TextStyle(color: Colors.white60),
                        ),
                        trailing: Text(
                          "${displayList[index].rating}",
                          style: TextStyle(color: Colors.amber),
                        ),
                        leading: Image.network(displayList[index].imageUrl!),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
