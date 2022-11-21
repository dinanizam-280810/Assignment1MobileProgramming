import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieSearchApp',
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'MSBox',
                  style: TextStyle(color: Colors.yellow),
                ),
                Icon(
                  Icons.movie_creation_outlined,
                  color: Colors.yellow,
                  size: 30.0,
                ),
              ],
            ),
          ),
          body: const HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  dynamic apikey, a, b, c, d, e, f, g, h, i, j, k, l, m, o;
  var about = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Text("Movie Search: ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Divider(),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: "Search Movie",
              prefixIcon: const Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          ElevatedButton(onPressed: _search, child: const Text("Search")),
          Container(
            color: Colors.black,
          ),
          Text(about.toString())
        ]),
      ),
    );
  }

  Future<void> _search() async {
   
  
    apikey = "e6b0f58e";
    var url = Uri.parse(
        'https://www.omdbapi.com/?t=Guardians of the Galaxy Vol. 2&apikey=e6b0f58e');

    var response = await http.get(url);
    var rescode = response.statusCode;

    if (rescode == 200) {
      var jsonData = response.body;
      var parsedJson = json.decode(jsonData);

      setState(() {
        
        a = parsedJson['Title'];
        b = parsedJson['Year'];
        c = parsedJson['Rated'];
        d = parsedJson['Released'];
        e = parsedJson['Runtime'];
        f = parsedJson['Genre'];
        g = parsedJson['Director'];
        h = parsedJson['Writer'];
        i = parsedJson['Actors'];
        j = parsedJson['Plot'];
        k = parsedJson['Language'];
        l = parsedJson['Country'];
        m = parsedJson['Awards'];

        about =
            "About: \n\nTitle: $a \n\nYear: $b \n\nRated: $c \n\nReleased: $d \n\nRuntime: $e \n\nGenre: $f \n\nDirector: $g \n\nWriter: $h \n\nActors: $i \n\nPlot: $j \n\nLanguage: $k \n\nCountry: $l \n\nAwards: $m ";
      });
    } else {
      setState(() {
        about = "No record";
      });
    }
  }
}
