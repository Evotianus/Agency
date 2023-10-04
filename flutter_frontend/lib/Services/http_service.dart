import 'dart:convert';
import 'package:flutter_frontend/Classes/news.dart';
import 'package:http/http.dart' as http;
import '../Classes/product.dart';
import '../Classes/user.dart';
import '../Classes/event.dart';

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

Future<Product?> buyProduct(path, productId, quantity, userId) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      "Content-Type": 'application/json',
      "Accept": 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'product_id': productId,
      'quantity': quantity,
      'user_id': userId,
    }),
  );

  print(jsonEncode(<String, dynamic>{
    'product_id': productId,
    'quantity': quantity,
    'user_id': userId,
  }));

  if (response.statusCode == 200) {
    print("Gacor bg");

    return Product.fromJson(jsonDecode(response.body));
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

Future<News?> insertNews(path, news) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(news),
  );
  print(uri + path);
  if (response.statusCode == 200) {
    print("Mantap");

    return News.fromJson(jsonDecode(response.body));
  }
  print("Yha :(");

  return null;
}

Future<String?> registerUser(path, user) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(user),
  );

  print(uri + path);
  print(jsonEncode(user));

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['message'];
  }

  return null;
}

Future<User?> loginUser(path, username, password) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'username': username,
      'password': password,
    }),
  );

  print(uri + path);
  print(jsonEncode(<String, String>{
    "username": username,
    "password": password,
  }));

  if (response.statusCode == 200) {
    print("gacor");
    return User.fromJson(jsonDecode(response.body));
  }

  return User(null, null, null, null, null, null);
}

Future<List<Event>?> getEvent(path) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      "Content-Type": 'application/json',
      "Accept": 'application/json',
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);

    List<Event> eventList = body.map((dynamic e) => Event.fromJson(e)).toList();

    return eventList;
  }

  return List.empty();
}

Future<String?> buyTicket(path, quantity, userId, eventId) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'quantity': quantity,
      'user_id': userId,
      'event_id': eventId,
    }),
  );
  print(jsonEncode(<String, dynamic>{
    'quantity': quantity,
    'user_id': userId,
    'event_id': eventId,
  }));

  if (response.statusCode == 200) {
    return "Ticket processed successfully!";
  }

  return null;
}

Future<String?> submitAudition(
    path, username, interest, photoUrl, description) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: jsonEncode(<String, dynamic>{
      'username': username,
      'interest': interest,
      'photo_url': photoUrl,
      'description': description
    }),
  );

  print(jsonEncode(<String, dynamic>{
    'username': username,
    'interest': interest,
    'photo_url': photoUrl,
    'description': description
  }));

  if (response.statusCode == 200) {
    return "Audition Submittion Success!";
  }

  return null;
}
