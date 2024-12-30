import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../screens/movie_screen.dart';

class MoviesSection extends StatelessWidget {
  List movies = [
    "Avatar 2",
    "Black Panther 2",
    "Black Adam",
    "Dune",
    "Thor Love And Thunder",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 500,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            aspectRatio: 16 / 9,
            viewportFraction: 0.65,
          ),
          items: [
            for (int i = 0; i < movies.length; i++)
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieScreen(
                                name: movies[i],
                              )));
                },
                child: Container(
                  margin: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/${movies[i]}.jpg",
                          fit: BoxFit.cover,
                          height: 300,
                          width: 300,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "PG-13",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Action",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        movies[i],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}
