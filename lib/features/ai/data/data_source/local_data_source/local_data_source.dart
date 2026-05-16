import '../../model/conversation_local_model.dart';

abstract class AiLocalDataSource {
  Future<List<ConversationLocalModel>> getConversations();
  Future<void> cacheConversations(List<ConversationLocalModel> conversations);
  Future<void> deleteConversation(String id);
}
