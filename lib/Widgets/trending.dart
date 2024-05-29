import 'package:flutter/material.dart';
import 'package:untitled/Utiles/text.dart';
import 'package:untitled/desc.dart';
class TrendingMovie extends StatelessWidget {
  const TrendingMovie({super.key, required this.trending});
  final List trending;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          modified_text(text:'Trenidng Movie',size: 26, color: Colors.white70,),
          SizedBox(height: 30,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Desc(
                        name:trending[index]['original_title']!=null? trending[index]['original_title']:trending[index]['name'],
                        desc: trending[index]['overview'],
                        bannerurl: 'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'],
                        posturl: 'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'],
                        vote:  trending[index]['vote_average'].toString(),
                        launchon: trending[index]['first_air_date'].toString())));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(5),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path']
                              )
                            )
                          ),
                        ),
                       // SizedBox(height: 3),
                        Flexible(
                          child: Container(
                               child: modified_text(text:trending[index]['original_title']!=null? trending[index]['original_title']:trending[index]['name'],color:Colors.white60, size: 15,),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: trending.length,
            ),
          )
        ],
      ),
    );
  }
}
