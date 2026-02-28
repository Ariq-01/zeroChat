class MessageEntity {
  final String id;
  final String text;
  final String senderId;

  MessageEntity({ required this.id, required this.text, required this.senderId});

  bool get isValid => text.isNotEmpty && text.length < 1000;

}