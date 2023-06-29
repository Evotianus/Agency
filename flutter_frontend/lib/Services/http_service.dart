import 'dart:convert';

import 'package:flutter_frontend/Classes/news.dart';
import 'package:http/http.dart' as http;
import '../Classes/product.dart';
import '../Services/http_service.dart';

String uri = "http://10.0.2.2:8000/api";

Future<Product?> showProduct(path, id) async {
  final response = await http.post(
    Uri.parse(uri + path + id),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    // body: jsonEncode(json),
  );

  if (response.statusCode == 200) {
    print(response.body);
    // return jsonDecode(response.body);
    return Product.fromJson(jsonDecode(response.body));
  }

  print(uri + path + id);
  print("Hai");
  return null;
}

Future<dynamic> buyProduct(path, productId, quantity) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      "Content-Type": 'application/json',
      "Accept": 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'product_id': productId,
      'quantity': quantity,
    }),
  );

  if (response.statusCode == 200) {
    print("Gacor bg");

    return jsonDecode(response.body);
  }

  return null;
}

Future<List<News>?> getNews(path) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  print(uri + path);
  if (response.statusCode == 200) {
    print("mantap");
    List<dynamic> body = jsonDecode(response.body);

    List<News> newsList =
        body.map((dynamic item) => News.fromJson(item)).toList();

    return newsList;
  }

  return null;
}

Future<News?> showNews(path, newsId) async {
  final response = await http.post(
    Uri.parse(uri + path + '/' + newsId),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    return News.fromJson(jsonDecode(response.body));
  }

  return null;
}
