import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/common_widgets/custom_text_form_field.dart';
import '../../../../../core/common_widgets/widgets.dart';
import '../../../../../core/services/speech_service.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/spacing.dart';
import '../../controller/ai_cubit.dart';

class TextFiledChatWidget extends StatefulWidget {
  const TextFiledChatWidget({super.key});

  @override
  State<TextFiledChatWidget> createState() => _TextFiledChatWidgetState();
}

class _TextFiledChatWidgetState extends State<TextFiledChatWidget> {
  final speechService = SpeechService();
  final TextEditingController controller = TextEditingController();
  bool isListening = false;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: context.surfaceColor,
          border: Border(top: BorderSide(color: context.border)),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            if (selectedImage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),

                child: Align(
                  alignment: Alignment.centerLeft,

                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),

                        child: Image.file(
                          selectedImage!,

                          height: 120,

                          width: 120,

                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        top: 4,

                        right: 4,

                        child: GestureDetector(
                          onTap: () {
                            selectedImage = null;

                            setState(() {});
                          },

                          child: Container(
                            padding: const EdgeInsets.all(4),

                            decoration: const BoxDecoration(
                              color: Colors.black,

                              shape: BoxShape.circle,
                            ),

                            child: const Icon(
                              Icons.close,

                              size: 18,

                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: controller,

                    hintText: "Ask anything...",

                    maxLines: 5,

                    minLines: 1,
                  ),
                ),

                horizontalSpace(10),

                Container(
                  decoration: BoxDecoration(
                    color: context.border,

                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: IconButton(
                    onPressed: pickImage,

                    icon: Icon(
                      Icons.image_outlined,

                      color: context.textPrimary,
                    ),
                  ),
                ),

                horizontalSpace(10),

                Container(
                  decoration: BoxDecoration(
                    color: isListening ? context.error : context.border,

                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: IconButton(
                    onPressed: () async {
                      if (isListening) {
                        await speechService.stopListening();

                        setState(() {
                          isListening = false;
                        });
                      } else {
                        setState(() {
                          isListening = true;
                        });

                        await speechService.startListening((text) {
                          controller.text = text;

                          setState(() {});
                        });
                      }
                    },

                    icon: Icon(
                      isListening ? Icons.mic : Icons.mic_none,

                      color: isListening ? Colors.white : context.textPrimary,
                    ),
                  ),
                ),

                horizontalSpace(10),

                Container(
                  decoration: BoxDecoration(
                    color: context.primaryColor,

                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: IconButton(
                    // onPressed: () async {
                    //   if (controller.text.trim().isEmpty &&
                    //       selectedImage == null) {
                    //     return;
                    //   }
                    //
                    //
                    //   final text = controller.text;
                    //   if (selectedImage != null) {
                    //
                    //     await context.read<AiCubit>().askVisionAi(
                    //       text: text,
                    //       image: selectedImage!,
                    //     );
                    //
                    //   } else {
                    //     await context.read<AiCubit>().askAi(text);
                    //   }
                    //   controller.clear();
                    //   selectedImage == null;
                    //   selectedImage?.path.isEmpty;
                    //   CommonWidget.scrollToBottom();
                    //   setState(() {});
                    // },
                    onPressed: () async {
                      if (controller.text.trim().isEmpty &&
                          selectedImage == null) {
                        return;
                      }

                      final text = controller.text;

                      final image = selectedImage;

                      controller.clear();

                      selectedImage = null;

                      setState(() {});

                      CommonWidget.scrollToBottom();

                      if (image != null) {
                        await context.read<AiCubit>().askVisionAi(
                          text: text,
                          image: image,
                        );
                      } else {
                        await context.read<AiCubit>().askAi(text);
                      }
                    },

                    icon: Icon(Icons.send, color: context.onPrimaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final appDir = await getApplicationDocumentsDirectory();

      final fileName = image.name;

      final savedImage = await File(
        image.path,
      ).copy('${appDir.path}/$fileName');

      selectedImage = savedImage;

      setState(() {});
    }
  }
}
