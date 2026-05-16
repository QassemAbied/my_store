class AiMessageEntity {

  final String message;

  final bool isUser;
  final String? imagePath;
  AiMessageEntity({

    required this.message,

    required this.isUser, this.imagePath,
  });
}