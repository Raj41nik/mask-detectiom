import 'package:flutter/material.dart';

import '../Utiles/text.dart';
import '../desc.dart';

class Tvs extends StatelessWidget {
  const Tvs({super.key, required this.tv});
  final List tv;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          modified_text(text:'Top Tv Shows',size: 26, color: Colors.white70,),
          SizedBox(height: 30,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Desc(name:tv[index]['original_title']!=null? tv[index]['original_title']:tv[index]['name'],
                        desc: tv[index]['overview'],
                        bannerurl: 'https://image.tmdb.org/t/p/w500' + tv[index]['backdrop_path'],
                        posturl: 'https://image.tmdb.org/t/p/w500' + tv[index]['poster_path'],
                        vote:  tv[index]['vote_average'].toString(),
                        launchon: tv[index]['first_air_date'].toString())));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tv[index]['backdrop_path']
                                  ),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                        SizedBox(height: 2),
                        Container(
                          child: modified_text(text:tv[index]['original_title']!=null? tv[index]['original_title']:tv[index]['original_name'],color:Colors.white60, size: 15,),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: tv.length,
            ),
          )
        ],
      ),
    );

  }
}
