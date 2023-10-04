import 'package:flutter/material.dart';
import 'package:flutter_frontend/audition_page.dart';
import 'package:flutter_frontend/home_page.dart';
import 'package:flutter_frontend/login_page.dart';
import 'package:flutter_frontend/main.dart';
import 'package:flutter_frontend/news_page.dart';
import 'package:flutter_frontend/shop_page.dart';

class DrawerWidget extends StatelessWidget {
  bool isLogin;
  String? loggedUserId;

  DrawerWidget({
    super.key,
    required this.isLogin,
    required this.loggedUserId,
  });

  @override
  Widget build(BuildContext context) {
    print(isLogin);
    // print(MyApp.loggedUser);
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                "Praise Ent.",
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
                      return HomePage(
                        isLogin: isLogin,
                        loggedUserId: loggedUserId,
                      );
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
                      return ShopPage(
                        isLogin: isLogin,
                        loggedUserId: loggedUserId,
                      );
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
                      return NewsPage(
                        isLogin: isLogin,
                        loggedUserId: loggedUserId,
                      );
                    },
                  ),
                ),
              },
            ),
            Divider(),
            ListTile(
              title: Text("Audition"),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AuditionPage(
                        isLogin: isLogin,
                        loggedUserId: loggedUserId,
                      );
                    },
                  ),
                ),
              },
            ),
            Divider(),
            Visibility(
              visible: !isLogin,
              child: ListTile(
                title: Text("Login"),
                onTap: () => {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return LoginPage(
                          isLogin: isLogin,
                          loggedUserId: loggedUserId,
                        );
                      },
                    ),
                  ),
                },
              ),
            ),
            Visibility(
              visible: !isLogin,
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
