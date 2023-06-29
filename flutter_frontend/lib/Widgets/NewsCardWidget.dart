import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_frontend/news-detail_page.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';

class NewsCardWidget extends StatelessWidget {
  String newsId;
  String title;
  String category;
  String image;
  String author;
  String authorProfile;
  String createdAt;

  NewsCardWidget({
    super.key,
    required this.newsId,
    required this.title,
    required this.category,
    required this.image,
    required this.author,
    required this.authorProfile,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    DateTime createdAtDateTime = DateTime.parse(createdAt);
    String timeAgo =
        timeago.format(createdAtDateTime, allowFromNow: true, locale: 'en');
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return NewsDetailPage(newsId: newsId);
        }));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(image),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage:
                                CachedNetworkImageProvider(authorProfile),
                          ),
                          SizedBox(width: 10),
                          Text(author),
                        ],
                      ),
                      Text(
                        timeAgo,
                        style: TextStyle(color: Colors.black26),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
