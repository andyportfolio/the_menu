class Event {
  final int event_id;
  final String image,end_date;
  final int restaurant_id;

  Event(
      {this.event_id,
      this.image,
      this.restaurant_id,
      this.end_date
      });

  factory Event.fromJson(Map<String, dynamic> parsedJson) {
    return Event(
        event_id: int.parse(parsedJson['event_id']),
        restaurant_id: int.parse(parsedJson['restaurant_id']),
        image: parsedJson['image'],
        end_date: parsedJson['end_date']);
  }
}

List<Event> events;