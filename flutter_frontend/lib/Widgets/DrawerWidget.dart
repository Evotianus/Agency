import 'package:flutter/material.dart';
import 'package:flutter_frontend/home_page.dart';
import 'package:flutter_frontend/news_page.dart';
import 'package:flutter_frontend/shop_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                "Database Agency",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            // Divider(),
            ListTile(
              title: Text("Event List"),
              onTap: () => {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return HomePage();
                    },
                  ),
                ),
              },
            ),
            Divider(),
            ListTile(
              title: Text("Shop"),
              onTap: () => {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ShopPage();
                    },
                  ),
                ),
              },
            ),
            Divider(),
            ListTile(
              title: Text("News"),
              onTap: () => {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return NewsPage();
                    },
                  ),
                ),
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
