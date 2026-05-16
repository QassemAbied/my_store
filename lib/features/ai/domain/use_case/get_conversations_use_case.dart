import '../entity/conversation_entity.dart';

import '../repository.dart';

class GetConversationsUseCase {
  final AiRepository repository;

  GetConversationsUseCase(this.repository);

  Future<List<ConversationEntity>> call() async {
    return await repository.getConversations();
  }
}
