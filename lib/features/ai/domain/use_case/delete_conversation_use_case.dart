import '../repository.dart';

class DeleteConversationUseCase {
  final AiRepository repository;

  DeleteConversationUseCase(this.repository);

  Future<void> call(String id) async {
    await repository.deleteConversation(id);
  }
}
