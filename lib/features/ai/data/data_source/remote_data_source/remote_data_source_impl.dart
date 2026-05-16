import 'dart:io';

import 'package:my_store/features/ai/data/data_source/remote_data_source/remote_data_source.dart';

import '../../../../../core/services/open_ai_service.dart';

class AiRemoteDataSourceImpl implements AiRemoteDataSource {
  final AiService aiService;

  AiRemoteDataSourceImpl(this.aiService);

  @override
  Stream<String> askAi(String message) {
    return aiService.askAi(message);
  }

  @override
  Stream<String> askVisionAi({
    required String message,
    required File image,
  }) {
    return  aiService.askVisionAi(message: message, image: image);
  }
}
