import 'package:hive_ce/hive.dart';

import 'ai_message_local_entity.dart';

part 'conversation_local_model.g.dart';

@HiveType(typeId: 31)
class ConversationLocalModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<AiMessageLocalModel> messages;

  @HiveField(3)
  final DateTime createdAt;

  ConversationLocalModel({
    required this.id,

    required this.title,

    required this.messages,

    required this.createdAt,
  });
}
