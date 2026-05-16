import 'package:hive_ce/hive.dart';

part 'ai_message_local_entity.g.dart';

@HiveType(typeId: 30)
class AiMessageLocalModel {

  @HiveField(0)
  final String message;

  @HiveField(1)
  final bool isUser;
  @HiveField(2)
  final String? imagePath;
  AiMessageLocalModel({

    required this.message,

    required this.isUser, this.imagePath,
  });
}