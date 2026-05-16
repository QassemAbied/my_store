import 'dart:io';
import 'entity/conversation_entity.dart';

abstract class AiRepository {
  Stream<String> askAi(String message);
  Stream<String> askVisionAi({ required String message, required File image, });

  Future<void> saveConversation(ConversationEntity conversation);

  Future<List<ConversationEntity>> getConversations();

  Future<void> deleteConversation(String id);
}
