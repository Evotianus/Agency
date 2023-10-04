import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_frontend/Widgets/InputBoxWidget.dart';
import 'package:flutter_frontend/shop_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Classes/product.dart';
import 'Services/http_service.dart';

class ProductDetailPage extends StatefulWidget {
  String id, image, title, loggedUserId;
  int price;

  ProductDetailPage({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.loggedUserId,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    final _quantityController = TextEditingController();
    final _usernameController = TextEditingController();

    int quantity = 1;

    _quantityController.text = quantity.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: showProduct(
          "/show-product/",
          widget.id,
        ),
        builder: (BuildContext context, AsyncSnapshot<Product?> snapshot) {
          Product? product = snapshot.data;
          if (snapshot.hasData) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: deviceHeight,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                width: double.infinity,
                                // height: deviceHeight / 3 - 25,
                                // color: Colors.red,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        product!.image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name!,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    // product.price.toString(),
                                    NumberFormat.simpleCurrency(locale: "id-ID")
                                        .format(product.price),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Quantity :",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black.withOpacity(0.3),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (quantity == 1) {
                                                return;
                                              }

                                              quantity--;

                                              _quantityController.text =
                                                  quantity.toString();
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.05),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                // border: Border.all(
                                                //   color: Colors.black26,
                                                //   width: 2,
                                                // ),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 75,
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.05),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            // color: Colors.black.withOpacity(1),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: _quantityController,
                                              textAlign: TextAlign.center,
                                              // textAlignVertical:
                                              //     TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                // contentPadding:
                                                //     EdgeInsets.only(bottom: 0),
                                              ),
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              quantity++;

                                              _quantityController.text =
                                                  quantity.toString();
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.05),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                // border: Border.all(
                                                //   color: Colors.black26,
                                                //   width: 2,
                                                // ),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // showDialog(
                        //   context: context,
                        //   barrierDismissible: false,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       insetPadding: EdgeInsets.all(10),
                        //       title: Text("Enter Username to Buy"),
                        //       content: InputBoxWidget(
                        //         label: "Username",
                        //         controller: _usernameController,
                        //       ),
                        //       actions: [
                        //         TextButton(
                        //           onPressed: () {
                        //             Navigator.of(context).pop();
                        //           },
                        //           child: Text("Buy Now!"),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );

                        Future<Product?> boughtProduct = buyProduct(
                            "/buy-product",
                            widget.id,
                            quantity,
                            widget.loggedUserId);

                        Navigator.of(context).pop();

                        // boughtProduct.then(
                        //   (value) {
                        //     print(value!.quantity);
                        //   },
                        // );
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // bottomNavigationBar: ElevatedButton(
      //   style: ButtonStyle(padding: ),
      //   onPressed: () {},
      //   child: Container(
      //     height: 50,
      //     alignment: Alignment.center,
      //     child: Text(
      //       "Buy Now",
      //       style: TextStyle(
      //         fontSize: 18,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
