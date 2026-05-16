import '../entity/conversation_entity.dart';

import '../repository.dart';

class SaveConversationUseCase {
  final AiRepository repository;

  SaveConversationUseCase(this.repository);

  Future<void> call(ConversationEntity conversation) async {
    await repository.saveConversation(conversation);
  }
}
