import 'dart:io';

import '../domain/entity/conversation_entity.dart';
import '../domain/mapper/conversation_mapper.dart';
import '../domain/repository.dart';
import 'data_source/local_data_source/local_data_source.dart';
import 'data_source/remote_data_source/remote_data_source.dart';

class AiRepositoryImpl implements AiRepository {
  final AiRemoteDataSource remote;

  final AiLocalDataSource local;

  AiRepositoryImpl(this.remote, this.local);
  @override
  Stream<String> askAi(String message) {
    return remote.askAi(message);
  }

  @override
  Stream<String> askVisionAi({required String message, required File image}) {
    return remote.askVisionAi(message: message, image: image);
  }

  @override
  Future<void> saveConversation(ConversationEntity conversation) async {
    final oldConversations = await local.getConversations();

    final index = oldConversations.indexWhere((e) => e.id == conversation.id);

    if (index != -1) {
      oldConversations[index] = ConversationMapper.toLocalModel(conversation);
    } else {
      oldConversations.add(ConversationMapper.toLocalModel(conversation));
    }

    await local.cacheConversations(oldConversations);
  }

  @override
  Future<List<ConversationEntity>> getConversations() async {
    final conversations = await local.getConversations();

    return conversations.map((e) {
      return ConversationMapper.toEntity(e);
    }).toList();
  }

  @override
  Future<void> deleteConversation(String id) async {
    await local.deleteConversation(id);
  }
}
