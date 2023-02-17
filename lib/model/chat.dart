class Chat {
  String? id;
  String? name;
  String? message;
  DateTime date;
  int unreadMessage;

  Chat({
    required this.id,
    required this.name,
    required this.message,
    required this.date,
    required this.unreadMessage
  });
}