import 'package:cached_network_image/cached_network_image.dart';
import 'package:crud_app/model/meal.dart';
import 'package:flutter/material.dart';

class ItemMealWidgets extends StatelessWidget {
  final Meal meal;
  const ItemMealWidgets({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          // clipRRect buat radius gambar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            // animasi, berkaitan ke beberapa page menggunakan tag:
            child: Hero(
              tag: meal.idMeal,
              child: CachedNetworkImage(
                imageUrl: meal.strMealThumb,
                height: 230.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // posisi text agar dibawah image
          Positioned(
            left: 10,
            bottom: 15,
            child: Text(
              meal.strMeal,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  shadows: [
                    Shadow(
                      offset: Offset(5.0, 4.0),
                      blurRadius: 6.0,
                      color: Colors.black,
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
