import 'package:flutter/material.dart';
import 'package:flutter_frontend/event-detail_page.dart';
import 'package:flutter_frontend/insert_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Widgets/DrawerWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text("User Lists"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // ListTile(
            //   title: Text("Hai Kawan"),
            //   // leading: Icon(Icons.add),
            //   // trailing: Icon(Icons.person),
            // ),
            // Divider(),
            // ListTile(
            //   title: Text("Hai Kawan"),
            // ),
            InkWell(
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return EventDetailPage(title: "Cat Expedition Event");
                    },
                  ),
                )
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/event-banner-1.jpg"),
                    fit: BoxFit.cover,
                  ),
                  // color: Colors.red,
                ),
                height: deviceHeight / 4,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(10)),
                            width: 75,
                            height: 40,
                            alignment: Alignment.center,
                            child: const Text(
                              "12/08",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // alignment: Alignment.bottomCenter,
                      height: 80,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cat Expedition Event",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("12 January 2025"),
                              ],
                            ),
                            Text(
                              "\$100",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const InsertPage();
              },
            ),
          );
        },
        // child: Icon(Icons.add),
      ),
    );
  }
}
