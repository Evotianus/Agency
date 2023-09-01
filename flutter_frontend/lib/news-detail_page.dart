import 'package:cached_network_image/cached_network_image.dart';
import 'Classes/news.dart';
import 'Services/http_service.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  String newsId;

  NewsDetailPage({
    super.key,
    required this.newsId,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        // appBar: AppBar(
        //   title: Text("Mantap"),
        // ),
        body: Stack(
          children: [
            FutureBuilder(
              future: showNews("/show-news", newsId),
              builder: (BuildContext context, AsyncSnapshot<News?> snapshot) {
                News? news = snapshot.data;
                if (news != null) {
                  final String? createdAt = news.createdAt;
                  String timeAgo = "";

                  if (createdAt != null && createdAt != "") {
                    DateTime createdAtDateTime = DateTime.parse(createdAt);
                    timeAgo = timeago.format(createdAtDateTime,
                        allowFromNow: true, locale: 'en');
                  } else {
                    timeAgo = "";
                  }
                  return Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.topLeft,
                              image: CachedNetworkImageProvider(news.image!),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Stack(
                          // clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 200),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                width: deviceWidth - 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text(
                                        news.category!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      news.title!,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "${news.author}     |     ${timeAgo}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.3),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      news.content!,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
