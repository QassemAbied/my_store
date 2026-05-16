import 'dart:io';

import '../repository.dart';

class AskVisionAiUseCase {
  final AiRepository repository;

  AskVisionAiUseCase(this.repository);

  Stream<String> call({required String message, required File image})  {
    return  repository.askVisionAi(message: message, image: image);
  }
}
