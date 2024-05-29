import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utiles/text.dart';
import '../desc.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.topRated});
  final List topRated;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          modified_text(text:'Top Rated Movies',size: 26, color: Colors.white70,),
          SizedBox(height: 30,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Desc(
                        name:topRated[index]['original_title']!=null? topRated[index]['original_title']:topRated[index]['name'],
                        desc: topRated[index]['overview'],
                        bannerurl: 'https://image.tmdb.org/t/p/w500' + topRated[index]['backdrop_path'],
                        posturl: 'https://image.tmdb.org/t/p/w500' + topRated[index]['poster_path'],
                        vote:  topRated[index]['vote_average'].toString(),
                        launchon: topRated[index]['first_air_date'].toString())));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          topRated[index]['poster_path']),
                                fit: BoxFit.cover
                              )
                          ),
                        ),
                        SizedBox(height: 10),
                        Flexible(
                          child: Container(
                            child: modified_text(text:topRated[index]['original_title']!=null? topRated[index]['original_title']:'loading',color:Colors.white60, size: 15,),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: topRated.length,
            ),
          )
        ],
      ),
    );

  }
}
