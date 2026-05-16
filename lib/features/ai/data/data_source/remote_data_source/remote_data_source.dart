import 'dart:io';

abstract class AiRemoteDataSource {
  Stream<String> askAi(String message);
  Stream<String> askVisionAi({required String message, required File image});
}
