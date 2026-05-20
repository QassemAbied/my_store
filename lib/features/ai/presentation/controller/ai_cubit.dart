import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/ai_message_entity.dart';
import '../../domain/entity/conversation_entity.dart';
import '../../domain/use_case/ask_ai_usecase.dart';
import '../../domain/use_case/ask_vision_ai_use_case.dart';
import '../../domain/use_case/delete_conversation_use_case.dart';
import '../../domain/use_case/get_conversations_use_case.dart';
import '../../domain/use_case/save_conversation_use_case.dart';
import 'ai_state.dart';

class AiCubit extends Cubit<AiState> {
  final AskAiUseCase askAiUseCase;
  final GetConversationsUseCase getConversationsUseCase;
  final AskVisionAiUseCase askVisionAiUseCase;
  final SaveConversationUseCase saveConversationUseCase;

  final DeleteConversationUseCase deleteConversationUseCase;

  AiCubit(
    this.askAiUseCase,
    this.deleteConversationUseCase,
    this.getConversationsUseCase,
    this.saveConversationUseCase,
    this.askVisionAiUseCase,
  ) : super(AiInitial());

  final List<AiMessageEntity> messages = [];
  final List<ConversationEntity> conversations = [];
  String? currentConversationId;
  Future<void> askAi(String text) async {
    currentConversationId ??= DateTime.now().millisecondsSinceEpoch.toString();
    messages.add(AiMessageEntity(message: text, isUser: true));
    emit(AiSuccess(List.from(messages)));

    try {
      String temp = "";
      bool added = false;
      await for (final chunk in askAiUseCase(text)) {
        if (!added) {
          messages.add(AiMessageEntity(message: "Thinking...", isUser: false));
          emit(AiSuccess(List.from(messages)));

          added = true;
        }

        for (final char in chunk.split("")) {
          temp += char;

          messages[messages.length - 1] = AiMessageEntity(
            message: "$temp▋",

            isUser: false,
          );

          emit(AiSuccess(List.from(messages)));

          await Future.delayed(const Duration(milliseconds: 15));
        }
      }

      if (added) {
        messages[messages.length - 1] = AiMessageEntity(
          message: temp,

          isUser: false,
        );

        emit(AiSuccess(List.from(messages)));

        await saveConversationUseCase(
          ConversationEntity(
            id: currentConversationId!,
            title: messages.first.message,
            messages: List.from(messages),
            createdAt: DateTime.now(),
          ),
        );

        await loadConversations();
      }
    } catch (e) {
      emit(AiError(e.toString()));
    }
  }

  Future<void> askVisionAi({required String text, required File image}) async {
    currentConversationId ??= DateTime.now().millisecondsSinceEpoch.toString();

    messages.add(
      AiMessageEntity(message: text, isUser: true, imagePath: image.path),
    );
    emit(AiSuccess(List.from(messages)));
    try {
      String temp = '';
      bool added = false;
      await for (final chunk in askVisionAiUseCase(
        message: text,
        image: image,
      )) {
        if (!added) {
          messages.add(AiMessageEntity(message: "Thinking...", isUser: false));
          emit(AiSuccess(List.from(messages)));
          added = true;
        }
        for (final char in chunk.split("")) {
          temp += char;
          messages[messages.length - 1] = AiMessageEntity(
            message: "$temp▋",
            isUser: false,
          );
          emit(AiSuccess(List.from(messages)));

          await Future.delayed(const Duration(milliseconds: 15));
        }
      }
      if (added) {
        messages[messages.length - 1] = AiMessageEntity(
          message: temp,
          isUser: false,
        );
        emit(AiSuccess(List.from(messages)));
        await saveConversationUseCase(
          ConversationEntity(
            id: currentConversationId!,
            title: messages.first.message,
            messages: List.from(messages),
            createdAt: DateTime.now(),
          ),
        );

        await loadConversations();
      }
    } catch (e) {
      emit(AiError(e.toString()));
    }
  }

  Future<void> loadConversations() async {
    final data = await getConversationsUseCase();

    conversations.clear();

    conversations.addAll(data);

    emit(AiSuccess(List.from(messages)));
  }

  void newChat() {
    messages.clear();

    currentConversationId = null;

    emit(AiSuccess(List.from(messages)));
  }

  void openConversation(ConversationEntity conversation) {
    messages.clear();

    messages.addAll(conversation.messages);

    currentConversationId = conversation.id;

    emit(AiSuccess(List.from(messages)));
  }

  Future<void> deleteConversation(String id) async {
    await deleteConversationUseCase(id);

    conversations.removeWhere((e) => e.id == id);

    emit(AiSuccess(List.from(messages)));
  }
}
