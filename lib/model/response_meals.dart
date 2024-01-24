import 'package:crud_app/model/meal.dart';

class ResponseMeals {
  final List<Meal> meals;

  ResponseMeals({
    required this.meals,
  });

  factory ResponseMeals.fromJson(Map<String, dynamic> json) => ResponseMeals(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  // UNTUK MENGIRIM DATA KE API
  // Map<String, dynamic> toJson() => {
  //       "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  //     };
}
