import '../../domain/entity/ai_message_entity.dart';

abstract class AiState {}

class AiInitial extends AiState {}

class AiLoading extends AiState {
  final List<AiMessageEntity> messages;

  AiLoading(this.messages);
}

class AiSuccess extends AiState {
  final List<AiMessageEntity> messages;

  AiSuccess(this.messages);
}

class AiError extends AiState {
  final String message;

  AiError(this.message);
}
