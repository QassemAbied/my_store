import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/ai/presentation/screen/widget/drawer_widget.dart';
import 'package:my_store/features/ai/presentation/screen/widget/empty_chat_widget.dart';
import 'package:my_store/features/ai/presentation/screen/widget/list_item_chat_widget.dart';
import 'package:my_store/features/ai/presentation/screen/widget/text_filed_chat_widget.dart';
import '../../../../core/common_widgets/widgets.dart';
import '../../../../core/services/speech_service.dart';
import '../controller/ai_cubit.dart';
import '../controller/ai_state.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  @override
  void initState() {
    super.initState();

    initSpeech();
    CommonWidget.scrollToBottom();
    context.read<AiCubit>().loadConversations();

    context.read<AiCubit>().newChat();
  }

  Future<void> initSpeech() async {
    await SpeechService().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),

      appBar: AppBar(title: Text("AI Assistant")),

      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<AiCubit, AiState>(
              builder: (context, state) {
                final cubit = context.read<AiCubit>();

                CommonWidget.scrollToBottom();

                return cubit.messages.isEmpty
                    ? EmptyChatWidget()
                    : ListItemChatWidget();
              },
            ),
          ),

          TextFiledChatWidget(),
        ],
      ),
    );
  }
}
