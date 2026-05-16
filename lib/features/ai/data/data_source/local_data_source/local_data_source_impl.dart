import 'package:hive_ce_flutter/adapters.dart';

import '../../../../../core/utils/constants.dart';
import '../../model/conversation_local_model.dart';
import 'local_data_source.dart';

class AiLocalDataSourceImpl implements AiLocalDataSource {
  final box = Hive.box(AppConstants.conversationsLocalKey);

  @override
  Future<void> cacheConversations(
    List<ConversationLocalModel> conversations,
  ) async {
    await box.put(AppConstants.conversationsLocalKey, conversations);
  }

  @override
  Future<List<ConversationLocalModel>> getConversations() async {
    final data = box.get(AppConstants.conversationsLocalKey);

    if (data != null) {
      return List<ConversationLocalModel>.from(data);
    }

    return [];
  }

  @override
  Future<void> deleteConversation(String id) async {
    final oldConversations = await getConversations();

    oldConversations.removeWhere((e) => e.id == id);

    await cacheConversations(oldConversations);
  }
}
