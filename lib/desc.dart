import 'package:flutter/material.dart';
import 'package:untitled/Utiles/text.dart';
class Desc extends StatelessWidget {
  const Desc({super.key, required this.name, required this.desc, required this.bannerurl, required this.posturl, required this.vote, required this.launchon});
  final String name,desc, bannerurl,posturl,vote,launchon;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl,fit: BoxFit.cover,),
                  )),
                  Positioned(
                      bottom: 10,
                      child: modified_text(text: '⭐️Average Rating '+ vote, color: Colors.white60, size: 18,)),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(text: name,size: 30,color: Colors.white60,),
            ),
            SizedBox(height: 15),
           Container(
              padding: EdgeInsets.only(left: 10),
              child:modified_text(text:launchon != 'null'? 'Realeasing On - '+launchon:'Realeasing On - loading 🔄',size: 24,color: Colors.white60,),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 300,
                  width: 120,
                  child: Image.network(posturl),
                ),
                SizedBox(width: 3),
                Flexible(
                  child: Container(
                    child: modified_text(
                      text: desc,
                      color: Colors.white54,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
