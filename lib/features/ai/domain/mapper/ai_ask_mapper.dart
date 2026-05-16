import '../entity/ai_message_entity.dart';
import '../../data/model/ai_message_local_entity.dart';

class AiLocalMapper {
  static AiMessageEntity toEntity(AiMessageLocalModel model) {
    return AiMessageEntity(message: model.message, isUser: model.isUser,imagePath: model.imagePath);
  }

  static AiMessageLocalModel toLocalModel(AiMessageEntity entity) {
    return AiMessageLocalModel(message: entity.message, isUser: entity.isUser,imagePath: entity.imagePath);
  }
}
