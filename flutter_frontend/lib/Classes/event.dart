class Event {
  String? eventId;
  String? title;
  int? ticketCount;
  int? price;
  String? eventDate;
  String? image;

  Event(
    this.eventId,
    this.title,
    this.ticketCount,
    this.price,
    this.eventDate,
    this.image,
  );

  Map<String, dynamic> toJson() => {
        'id': eventId,
        'title': title,
        'ticket_count': ticketCount,
        'price': price,
        'event_date': eventDate,
        'image': image,
      };

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      json['id'],
      json['title'],
      json['ticket_count'],
      json['price'],
      json['event_date'],
      json['image'],
    );
  }
  // Event.fromJson(Map<String, dynamic> json)
  //     : eventId = json['id'],
  //       title = json['title'],
  //       ticketCount = json['ticket_count'],
  //       price = json['price'],
  //       eventDate = json['event_date'];
}
