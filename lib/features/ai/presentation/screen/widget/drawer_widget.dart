import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common_widgets/custom_primary_button.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/spacing.dart';
import '../../controller/ai_cubit.dart';
import '../../controller/ai_state.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiCubit, AiState>(
      builder: (context, state) {
        final cubit = context.read<AiCubit>();
        return Drawer(
          backgroundColor: context.surfaceColor,

          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Conversations",
                    style: AppTextStyle.bold(
                      fontSize: 24,
                      color: context.textPrimary,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  child: SizedBox(
                    width: double.infinity,

                    child: CustomElevatedButton(
                      onPressed: () {
                        cubit.newChat();

                        Navigator.pop(context);
                      },
                      text: "New Chat",
                      isIcon: true,
                      icon: Icon(Icons.add),
                    ),
                  ),
                ),

                verticalSpace(20),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    itemCount: cubit.conversations.length,

                    itemBuilder: (context, index) {
                      final conversation = cubit.conversations[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),

                        decoration: BoxDecoration(
                          color: context.border,

                          borderRadius: BorderRadius.circular(18),
                        ),

                        child: ListTile(
                          onTap: () {
                            cubit.openConversation(conversation);
                            Navigator.pop(context);
                          },

                          leading: Icon(
                            Icons.chat_bubble_outline,

                            color: context.primaryColor,
                          ),

                          title: Text(
                            conversation.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.medium(
                              fontSize: 15,
                              color: context.textPrimary,
                            ),
                          ),

                          trailing: IconButton(
                            onPressed: () async {
                              await cubit.deleteConversation(conversation.id);
                            },

                            icon: Icon(
                              Icons.delete_outline,
                              color: context.error,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
