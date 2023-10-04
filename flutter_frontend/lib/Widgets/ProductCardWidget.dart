import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/product-detail_page.dart';
import 'package:intl/intl.dart';

class ProductCardWidget extends StatelessWidget {
  String image, title, id, loggedUserId;
  int price;

  ProductCardWidget({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.loggedUserId,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductDetailPage(
                id: id,
                image: image,
                title: title,
                price: price,
                loggedUserId: loggedUserId,
              );
            },
          ),
        );
      },
      child: Container(
        height: deviceHeight / 4 + 10,
        width: deviceWidth / 2 - 35,
        decoration: BoxDecoration(
            // color: Colors.amber,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      image,
                      errorListener: () {
                        // image
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              // "Rp ${NumberFormat(price)}",
              NumberFormat.simpleCurrency(locale: "id-ID").format(price),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
