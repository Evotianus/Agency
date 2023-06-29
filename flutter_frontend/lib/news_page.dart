import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/Widgets/NewsCardWidget.dart';
import 'package:flutter_frontend/news-insert_page.dart';
import 'Widgets/DrawerWidget.dart';
import 'Classes/news.dart';
import 'Services/http_service.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //  newsList;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        title: Text("News"),
      ),
      drawer: DrawerWidget(),
      body: FutureBuilder(
        future: getNews('/get-news'),
        builder: (BuildContext, AsyncSnapshot<List<News>?> snapshot) {
          List<News>? newsList = snapshot.data;
          if (newsList != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Wrap(
                  runSpacing: 10,
                  children: newsList.map((News news) {
                    print(news.createdAt);
                    return NewsCardWidget(
                        newsId: news.newsId,
                        title: news.title,
                        category: news.category,
                        image: news.image,
                        author: news.author,
                        authorProfile: news.authorProfile,
                        createdAt: news.createdAt);
                  }).toList(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return NewsInsertPage();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
