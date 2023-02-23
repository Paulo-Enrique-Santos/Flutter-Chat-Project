class Message {
  String message;
  int idUser;

  Message({
    required this.message,
    required this.idUser,
  });

  static List<Message> getListMessage() {
    return [];
  }

  Message.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        idUser = json['idUser'];

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'idUser': idUser,
    };
  }
}