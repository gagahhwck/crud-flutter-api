import 'package:crud_app/model/response_meals.dart';
import 'package:crud_app/network/net_client.dart';
import 'package:crud_app/ui/widgets/list_meals_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // proses pengambilan datanya
  late ResponseMeals responseMeals;
  bool isLoading = false;
  final _netClient = NetClient();
  // variable untuk default menu bottom item
  int currentIndex = 0;
  // variable untuk default menu bottom item

  void fetchDataFilterMeals() async {
    setState(() {
      isLoading = true;
    });

    responseMeals = await _netClient.fetchDataFilterMeals(currentIndex);
    print(responseMeals.meals.length);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataFilterMeals();
  }
  // end proses pengambilan datanya

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              print("favorite berjalan");
            },
            icon: Icon(Icons.favorite_border),
          ),
        ],
        centerTitle: true,
        title: const Text('List Menu'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ListMealsWidgets(
                responseData: responseMeals,
              ),
      ),
      // BUAT NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          // action item button
          onTap: (index) {
            print(index);
            currentIndex = index;
            // biar dapetin data api setiap klik
            fetchDataFilterMeals();
          },
          selectedItemColor: Colors.blue,
          items: const [
            // item navigation
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), label: "seafood"),
            BottomNavigationBarItem(icon: Icon(Icons.cake), label: "Dessert"),
            // end item navigation
          ]),
    );
  }
}
