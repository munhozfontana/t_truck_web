class MessageEntity {
  final int id;
  final String nameFrom;
  final String nameTo;
  final String content;
  final DateTime sendAt;

  MessageEntity({
    required this.id,
    required this.content,
    required this.sendAt,
    required this.nameFrom,
    required this.nameTo,
  });
}
