import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mime/mime.dart';
import '../common_models/entities/product_entities.dart';

class AiService {
  Stream<String> askAi(String message) async* {
    final dio = Dio();

    final apiKey = dotenv.env['OPEN_ROUTER_API_KEY'];

    try {
      final response = await dio.post(
        'https://openrouter.ai/api/v1/chat/completions',

        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',

            'Content-Type': 'application/json',
          },
          responseType: ResponseType.stream,
        ),

        data: {
          "model": "openai/gpt-3.5-turbo",
          "stream": true,
          "messages": [
            {"role": "user", "content": message},
          ],
        },
      );

      await for (final chunk in response.data.stream) {
        final text = utf8.decode(chunk);

        final lines = text.split("\n");

        for (final line in lines) {
          if (line.startsWith("data: ")) {
            final jsonString = line.replaceFirst("data: ", "");

            if (jsonString == "[DONE]") {
              break;
            }

            try {
              final data = jsonDecode(jsonString);

              final content = data["choices"]?[0]["delta"]?["content"];

              if (content != null) {
                yield content;
              }
            } catch (_) {}
          }
        }
      }
    } on DioException catch (_) {
      rethrow;
    }
  }

  Stream<String> askVisionAi({
    required String message,

    required File image,
  })
  async* {
    final dio = Dio();

    final apiKey = dotenv.env['OPEN_ROUTER_API_KEY'];

    final bytes = await image.readAsBytes();

    final base64Image = base64Encode(bytes);

    final mimeType = lookupMimeType(image.path);

    try {
      final response = await dio.post(
        'https://openrouter.ai/api/v1/chat/completions',

        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',

            'Content-Type': 'application/json',
          },

          responseType: ResponseType.stream,
        ),

        data: {
          "model": "openai/gpt-4o-mini",

          "stream": true,

          "messages": [
            {
              "role": "user",

              "content": [
                {"type": "text", "text": message},

                {
                  "type": "image_url",

                  "image_url": {"url": "data:$mimeType;base64,$base64Image"},
                },
              ],
            },
          ],
        },
      );

      await for (final chunk in response.data.stream) {
        final text = utf8.decode(chunk);

        final lines = text.split("\n");

        for (final line in lines) {
          if (line.startsWith("data: ")) {
            final jsonString = line.replaceFirst("data: ", "");

            if (jsonString == "[DONE]") {
              break;
            }

            try {
              final data = jsonDecode(jsonString);

              final content = data["choices"]?[0]["delta"]?["content"];

              if (content != null) {
                yield content;
              }
            } catch (_) {}
          }
        }
      }
    } on DioException catch (_) {
      rethrow;
    }
  }
  Future<List<String>> generateSearchKeywords(String query) async {
    final dio = Dio();

    final apiKey = dotenv.env['OPEN_ROUTER_API_KEY'];

    try {
      final response = await dio.post(
        'https://openrouter.ai/api/v1/chat/completions',

        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',

            'Content-Type': 'application/json',
          },
        ),

        data: {
          "model": "openai/gpt-4o-mini",

          "messages": [
            {
              "role": "system",

              "content":
                  """ Return shopping search keywords as JSON array only. Example: ["nike", "shoes", "running"] Do not return anything else. """,
            },

            {"role": "user", "content": query},
          ],
        },
      );

      final text = response.data['choices'][0]['message']['content'].toString();
      final keywords = List<String>.from(jsonDecode(text));
      print(keywords);

      return keywords;
    } on DioException catch (e) {
      print(e.response?.data);

      rethrow;
    }
  }
  //   Future<List<String>> generateRecommendations({
  //     required String title,
  //
  //     required String description,
  //   })
  //   async {
  //     final dio = Dio();
  //
  //     final apiKey = dotenv.env['OPEN_ROUTER_API_KEY'];
  //
  //     try {
  //       final response = await dio.post(
  //         'https://openrouter.ai/api/v1/chat/completions',
  //
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $apiKey',
  //
  //             'Content-Type': 'application/json',
  //           },
  //         ),
  //
  //         data: {
  //           "model": "openai/gpt-4o-mini",
  //
  //           "messages": [
  //             {
  //               "role": "system",
  //
  //               "content": """
  //                Suggest related shopping items.
  //
  //                Return JSON array only.
  //
  //                 Example:
  //                  [
  //                   "sport socks",
  //                   "gym bag",
  //                   "smart watch"
  //                  ]
  //                    """,
  //             },
  //
  //             {
  //               "role": "user",
  //
  //               "content":
  //                   """
  // Title:
  // $title
  //
  // Description:
  // $description
  // """,
  //             },
  //           ],
  //         },
  //       );
  //
  //       final text = response.data['choices'][0]['message']['content'].toString();
  //
  //       return List<String>.from(jsonDecode(text));
  //     } on DioException catch (e) {
  //       print(e.response?.data);
  //
  //       rethrow;
  //     }
  //   }
  Future<List<String>> generateRecommendations({
    required String title,

    required String description,

    required List<ProductItemEntity> allProducts,
  })
  async {
    final dio = Dio();

    final apiKey = dotenv.env['OPEN_ROUTER_API_KEY'];

    final productNames = allProducts.map((e) => e.title).join('\n');

    try {
      final response = await dio.post(
        'https://openrouter.ai/api/v1/chat/completions',

        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',

            'Content-Type': 'application/json',
          },
        ),

        data: {
          "model": "openai/gpt-4o-mini",

          "messages": [
            {
              "role": "system",

              "content": """
You are an AI shopping assistant.

Choose ONLY products
from the available products list.

Return JSON array only.

Example:
[
 "Nike Shoes",
 "Blue Hoodie"
]
""",
            },

            {
              "role": "user",

              "content":
                  """
Current Product:
$title

Description:
$description

Available Products:
$productNames
""",
            },
          ],
        },
      );

      final text = response.data['choices'][0]['message']['content'].toString();

      final cleanedText = text
          .replaceAll('```json', '')
          .replaceAll('```', '')
          .trim();

      print(cleanedText);

      return List<String>.from(jsonDecode(cleanedText));
    } catch (e) {
      print(e);

      rethrow;
    }
  }
  //   Future<List<String>> generateRecommendations({
  //     required String title,
  //
  //     required String description,
  //
  //     required List<ProductItemEntity> allProducts,
  //   }) async {
  //     final dio = Dio();
  //
  //     final apiKey = dotenv.env['OPEN_ROUTER_API_KEY'];
  //
  //     final productNames = allProducts.map((e) => e.title).join('\n');
  //
  //     try {
  //       final response = await dio.post(
  //         'https://openrouter.ai/api/v1/chat/completions',
  //
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $apiKey',
  //
  //             'Content-Type': 'application/json',
  //           },
  //         ),
  //
  //         data: {
  //           "model": "openai/gpt-4o-mini",
  //
  //           "messages": [
  //             {
  //               "role": "system",
  //
  //               "content": """
  // You are an AI shopping assistant.
  //
  // Choose ONLY products
  // from the available products list.
  //
  // Return JSON array only.
  // """,
  //             },
  //
  //             {
  //               "role": "user",
  //
  //               "content":
  //                   """
  // Current Product:
  // $title
  //
  // Description:
  // $description
  //
  // Available Products:
  // $productNames
  // """,
  //             },
  //           ],
  //         },
  //       );
  //
  //       final text = response.data['choices'][0]['message']['content'].toString();
  //
  //       return List<String>.from(jsonDecode(text));
  //     } catch (e) {
  //       rethrow;
  //     }
  //   }
}
