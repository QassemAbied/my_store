import '../../data/model/conversation_local_model.dart';

import '../entity/conversation_entity.dart';

import 'ai_ask_mapper.dart';

class ConversationMapper {
  static ConversationEntity toEntity(ConversationLocalModel model) {
    return ConversationEntity(
      id: model.id,

      title: model.title,

      messages: model.messages.map((e) {
        return AiLocalMapper.toEntity(e);
      }).toList(),

      createdAt: model.createdAt,
    );
  }

  static ConversationLocalModel toLocalModel(ConversationEntity entity) {
    return ConversationLocalModel(
      id: entity.id,

      title: entity.title,

      messages: entity.messages.map((e) {
        return AiLocalMapper.toLocalModel(e);
      }).toList(),

      createdAt: entity.createdAt,
    );
  }
}
