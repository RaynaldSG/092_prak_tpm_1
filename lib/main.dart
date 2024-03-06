import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const Color primaryColor = Color(0xFF070F2B);
const Color secondaryColor = Color(0xFF1B1A55);
const Color thirdColor = Color(0xFF535C91);
const Color fourthColor = Color(0xFF9290C3);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String appTitle = "TUGAS 1";
    const List<String> movieTitle = ["Avengers : Infinity War", "Avengers : Endgame", "Your Name", "Puss In Boots : The Last Wish"];
    const List<String> moviePoster = ["assets/img/poster1.jpg", "assets/img/poster2.jpg", "assets/img/poster3.jpg", "assets/img/poster4.jpg"];
    const List<String> movieDirector = ["Anthony Russo & Joe Russo", "Anthony Russo & Joe Russo", "Makoto Shinkai", "Joel Crawford"];
    const List<String> movieYear = ["2018", "2019", "2016", "2022"];
    const List<String> movieGenre = ["Action/Sci-fi", "Action/Sci-fi", "Anime", "Family/Adventure"];

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(scaffoldBackgroundColor: primaryColor),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text(
              appTitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: secondaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MovieSearchBar(),
              Text(
                "TOP MOVIES",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.75),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              for(int i = 0; i < 4; i++)...[
                MovieImage(image: moviePoster[i]),
                InformationBar(movieTitle: movieTitle[i], director: movieDirector[i], year: movieYear[i], genre: movieGenre[i]),
                MovieButtonGroup(),
              ],
              Footer(),
              // MovieImage(image: "assets/img/poster1.jpg"),
              // InformationBar(movieTitle: "AVENGERS:INFINITY WAR", director: "Anthony Russo & Joe Russo", year: "2018", genre: "Action/Sci-fi"),
              // MovieButtonGroup(),
              // Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieSearchBar extends StatelessWidget {
  const MovieSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10)
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class MovieImage extends StatelessWidget {
  final String image;

  const MovieImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Image.asset(
        image,
        width: 600,
        height: 700,
        fit: BoxFit.cover,
      ),
    );
  }
}

class InformationBar extends StatelessWidget{
  final String movieTitle;
  final String director;
  final String year;
  final String genre;

  const InformationBar({
    super.key,
    required this.movieTitle,
    required this.director,
    required this.year,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            movieTitle,
            style: TextStyle(
              fontSize: 24,
              color: thirdColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15, bottom: 15),
              child: Text(
                director,
                style: TextStyle(
                  color: thirdColor,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15, bottom: 15),
              child: Text(
                year,
                style: TextStyle(
                  color: thirdColor,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                genre,
                style: TextStyle(
                  color: thirdColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MovieButtonGroup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: (){},
          child: Row(
              children: [
                Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                Text(
                  "PLAY",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ]
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
        ),
        ElevatedButton(
          onPressed: (){},
          child: Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                Text(
                  "PLAYLIST",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ]
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
        ),
        ElevatedButton(
          onPressed: (){},
          child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ]
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 40,
      alignment: Alignment.center,
      child: Text(
        "Made By Raynald Sage K. 123210092",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: secondaryColor,
    );
  }

}