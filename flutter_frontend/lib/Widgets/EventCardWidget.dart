import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/Widgets/InputBoxWidget.dart';
import 'package:flutter_frontend/event-detail_page.dart';
import 'package:intl/intl.dart';
import '../Services/http_service.dart';

class EventCardWidget extends StatelessWidget {
  final _quantityController = TextEditingController();

  String eventId;
  String title;
  String eventDate;
  int price;
  int ticketCount;
  String image;
  String? loggedUserId;

  EventCardWidget({
    super.key,
    required this.eventId,
    required this.title,
    required this.eventDate,
    required this.price,
    required this.ticketCount,
    required this.image,
    required this.loggedUserId,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    DateTime dateTime = DateTime.parse(eventDate);
    String date = DateFormat("dd/MM").format(dateTime);

    return InkWell(
      onTap: () => {
        showDialog(
          context: context,
          // barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Enter Quantity"),
              content: InputBoxWidget(
                label: "Quantity",
                controller: _quantityController,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    buyTicket(
                      "/buy-ticket",
                      _quantityController.text,
                      loggedUserId,
                      eventId,
                    );

                    Navigator.of(context).pop();
                  },
                  child: Text("Buy ticket!"),
                )
              ],
            );
          },
        )
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) {
        //       return EventDetailPage(title: title, eventId: eventId);
        //     },
        //   ),
        // )
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: CachedNetworkImageProvider(image),
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 75,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      date,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${ticketCount} ticket left"),
                      ],
                    ),
                    Text(
                      NumberFormat.simpleCurrency(
                              locale: "id-ID", decimalDigits: 0)
                          .format(price),
                      style: TextStyle(
                        fontSize: 18,
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
    );
  }
}
