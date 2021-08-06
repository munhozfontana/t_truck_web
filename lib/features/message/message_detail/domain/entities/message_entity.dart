class MessageChatEntity {
  final String personSender;
  final String messageContent;
  final DateTime createAt;

  MessageChatEntity({
    required this.personSender,
    required this.messageContent,
    required this.createAt,
  });
}
