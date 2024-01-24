import 'package:cached_network_image/cached_network_image.dart';
import 'package:crud_app/model/meal.dart';
import 'package:crud_app/network/net_client.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  // pengiriman data id dari homepage
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // proses pengambilan datanya
  late Meal meal;
  bool isLoading = false;
  final _netClient = NetClient();

  void FetchDataDetail() async {
    setState(() {
      isLoading = true;
    });

    final responseDetail = await _netClient.fetchDataDetail(widget.id);
    meal = responseDetail.meals[0];
    print(meal.strMeal);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    FetchDataDetail();
  }
  // end proses pengambilan datanya

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text("Detail Receipt"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ],
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  backgroundColor: Colors.orange,
                  strokeWidth: 5,
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Hero(
                            tag: '${meal.idMeal}',
                            child: Material(
                              child: CachedNetworkImage(
                                  imageUrl: meal.strMealThumb),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text('${meal.strMeal}'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: Text('Instruction'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text('${meal.strInstructions}'),
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }
}
