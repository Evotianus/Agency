import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/Classes/Product.dart';
import 'package:flutter_frontend/Widgets/ProductCardWidget.dart';
import 'Widgets/DrawerWidget.dart';
import 'package:http/http.dart' as http;

// Android Studio Emulator : 10.0.2.2:8000
// Laptop Hotspot : 192.168.137.1
String uri = "http://10.0.2.2:8000/api";

Future<List<Product>> getProduct() async {
  final response = await http.post(
    Uri.parse("$uri/get-product"),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);

    List<Product> products = body
        .map(
          (dynamic item) => Product.fromJson(item),
        )
        .toList();
    return products;
  }

  return List.empty();
  // throw Exception("Failed to get Product");
}

class ShopPage extends StatefulWidget {
  bool isLogin;
  String? loggedUserId;

  ShopPage({
    super.key,
    required this.isLogin,
    required this.loggedUserId,
  });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      drawer: DrawerWidget(
        isLogin: widget.isLogin,
        loggedUserId: widget.loggedUserId,
      ),
      appBar: AppBar(
        title: Text("Shop"),
      ),
      body: FutureBuilder(
        future: getProduct(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          List<Product>? products = snapshot.data;
          if (products != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  // height: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 20,
                    children: products.map((Product product) {
                      return ProductCardWidget(
                        id: product.productId!,
                        image: product.image!,
                        title: product.name!,
                        price: product.price!,
                      );
                    }).toList(),

                    // ProductCardWidget(
                    //   image:
                    //       "https://cdn.kyou.id/thumbnail/items/102336-hu-tao-ghost-night-lamp-15x14cm-genshin-impact.jpg.webp",
                    //   title: "[REVIVE] Hu Tao Ghost Night Lamppp",
                    //   price: 100000,
                    // ),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
