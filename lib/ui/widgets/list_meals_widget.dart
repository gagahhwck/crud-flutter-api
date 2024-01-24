import 'package:crud_app/model/response_meals.dart';
import 'package:crud_app/ui/pages/detail_page.dart';
import 'package:crud_app/ui/widgets/item_meals_widget.dart';
import 'package:flutter/material.dart';

class ListMealsWidgets extends StatelessWidget {
  final ResponseMeals responseData;
  final Function()? fetchDataMeals;
  const ListMealsWidgets(
      {super.key, required this.responseData, this.fetchDataMeals});

  @override
  Widget build(BuildContext context) {
    if (responseData.meals.isEmpty) {
      return const Text("Data meals kosong");
    }
    return ListView.builder(
      itemCount: responseData.meals.length,
      itemBuilder: (context, index) {
        final itemMeal = responseData.meals[index];
        return GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(id: itemMeal.idMeal),
                ),
              );
            },
            child: ItemMealWidgets(meal: itemMeal));
      },
    );
  }
}
