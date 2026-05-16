import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:my_store/core/common_widgets/widgets.dart';

import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../controller/ai_cubit.dart';

class ListItemChatWidget extends StatelessWidget {
  const ListItemChatWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AiCubit>();
    return ListView.builder(
      controller: CommonWidget.scrollController,

      physics: const BouncingScrollPhysics(),

      padding: const EdgeInsets.all(16),

      itemCount: cubit.messages.length,

      itemBuilder: (context, index) {
        final message = cubit.messages[index];

        return Align(
          alignment: message.isUser
              ? Alignment.centerRight
              : Alignment.centerLeft,

          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),

            child: Container(
              margin: EdgeInsets.only(
                bottom: index == cubit.messages.length - 1 ? 50 : 12,
              ),

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: message.isUser ? context.primaryColor : context.border,

                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(22),

                  topRight: const Radius.circular(22),

                  bottomLeft: Radius.circular(message.isUser ? 22 : 6),

                  bottomRight: Radius.circular(message.isUser ? 6 : 22),
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),

                    blurRadius: 10,

                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  if (message.message.trim().isNotEmpty)
                    MarkdownBody(
                      data: message.message,

                      selectable: true,

                      styleSheet: MarkdownStyleSheet(
                        p: AppTextStyle.medium(
                          fontSize: 16,

                          color: message.isUser
                              ? context.onPrimaryColor
                              : context.textPrimary,
                        ),
                      ),
                    ),

                  if (message.imagePath != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),

                        child: Image.file(
                          File(message.imagePath!),

                          height: 220,

                          width: 220,

                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),

            ),
          ),
        ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.2, end: 0);
      },
    );
  }
}
