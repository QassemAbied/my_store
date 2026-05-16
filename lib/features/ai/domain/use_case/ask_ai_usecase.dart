import '../repository.dart';

class AskAiUseCase {
  final AiRepository repository;

  AskAiUseCase(this.repository);

  Stream<String> call(String message)  {
    return  repository.askAi(message);
  }
}
