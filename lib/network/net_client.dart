import 'dart:convert';

import 'package:crud_app/model/response_meals.dart';
import 'package:http/http.dart' as http;

class NetClient {
  final baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  Future<ResponseMeals> fetchDataFilterMeals(int currentIndex) async {
    late String endPoint;
    // buat kondisi filter untuk pengambilan bottom item
    if (currentIndex == 0) {
      endPoint = "filter.php?c=Seafood";
    } else {
      endPoint = "filter.php?c=Dessert";
    }

    try {
      final response = await http.get(
        Uri.parse(baseUrl + endPoint),
      );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final responseMeals = ResponseMeals.fromJson(responseBody);
        return responseMeals;
      } else {
        print(response.statusCode);
        return ResponseMeals(meals: []);
      }
    } catch (e) {
      print(e);
      return ResponseMeals(meals: []);
    }
  }

  // buat pengambilan data detail meals berdasarkan ID
  Future<ResponseMeals> fetchDataDetail(String id) async {
    // ambil endpoint ditambah $id pada parameter id
    final endPoint = "lookup.php?i=$id";

    try {
      final response = await http.get(
        Uri.parse(baseUrl + endPoint),
      );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final responseMeals = ResponseMeals.fromJson(responseBody);
        return responseMeals;
      } else {
        print(response.statusCode);
        return ResponseMeals(meals: []);
      }
    } catch (e) {
      print(e);
      return ResponseMeals(meals: []);
    }
  }
}
