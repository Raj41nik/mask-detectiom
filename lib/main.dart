import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Utiles/text.dart';
import 'package:untitled/Widgets/topRated.dart';
import 'package:untitled/Widgets/tv.dart';

import 'Widgets/trending.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.blueGrey,
      ),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovie=[];
  List topRatedMovie=[];
  List tv=[];

  final String apikey = '087cfa2e803be132bb93822fcbc829c0';
  final readAccessToeken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwODdjZmEyZTgwM2JlMTMyYmI5MzgyMmZjYmM4MjljMCIsInN1YiI6IjY2MTZmMzAwY2I3NWQxMDE2Mjc0ZjdiZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.SJZ9eRVCbhXJqX0XOE9Hyzjmg1eitlk8-Dx11eYKNe8';

 void initState(){
   loadmovie();
   super.initState();
 }

  loadmovie() async{
    TMDB tmbdWithCustomLogs= TMDB(ApiKeys(apikey,readAccessToeken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    )
    );
    Map trendingResult=await tmbdWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult=await tmbdWithCustomLogs.v3.movies.getTopRated();
    Map tvResult=await tmbdWithCustomLogs.v3.tv.getPopular();
    //print(trendingResult);
    setState(() {
      trendingMovie=trendingResult['results'];
      topRatedMovie=topRatedResult['results'];
      tv=tvResult['results'];
      //print(topRatedMovie);
      print(trendingMovie);
      print(tv);
       });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title:modified_text(text:'Movie Review App', color: Colors.white60, size:24,)

      ),
      body: ListView(
          children: [
            Tvs(tv:tv),
            TopRated(topRated: topRatedMovie),
            TrendingMovie(trending:trendingMovie,),
            SizedBox(height: 10),
          ],
      ),
    );
  }
}


