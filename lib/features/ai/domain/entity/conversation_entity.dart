import 'ai_message_entity.dart';

class ConversationEntity {

  final String id;

  final String title;

  final List<AiMessageEntity>
  messages;

  final DateTime createdAt;

  ConversationEntity({

    required this.id,

    required this.title,

    required this.messages,

    required this.createdAt,
  });
}