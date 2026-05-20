// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:my_store/core/theme/color_extension.dart';
//
// import '../../../../../core/utils/app_text_style.dart';
//
// class CodeBlockWidget extends StatefulWidget {
//   final String code;
//
//   final String language;
//
//   const CodeBlockWidget({
//     super.key,
//
//     required this.code,
//
//     required this.language,
//   });
//
//   @override
//   State<CodeBlockWidget> createState() => _CodeBlockWidgetState();
// }
//
// class _CodeBlockWidgetState extends State<CodeBlockWidget> {
//   Highlighter? highlighter;
//
//   @override
//   void initState() {
//     super.initState();
//
//     initHighlighter();
//   }
//
//   Future<void> initHighlighter() async {
//     await Highlighter.initialize(['all']);
//
//     highlighter = Highlighter(
//       language: widget.language.isEmpty ? 'dart' : widget.language,
//       theme: await HighlighterTheme.loadForBrightness(context.theme.brightness),
//     );
//     if (!mounted) return;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (highlighter == null) {
//       return const SizedBox();
//     }
//
//     final highlighted = highlighter!.highlight(widget.code);
//
//     return Container(
//       decoration: BoxDecoration(
//         color: context.surfaceColor,
//         borderRadius: BorderRadius.circular(18),
//       ),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//
//             decoration: BoxDecoration(
//               color: context.disabled,
//
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(16),
//
//                 topRight: Radius.circular(16),
//               ),
//             ),
//
//             child: Row(
//               children: [
//                 Text(
//                   widget.language,
//                   style: AppTextStyle.medium(fontSize: 14, color: Colors.white),
//                 ),
//
//                 const Spacer(),
//
//                 InkWell(
//                   onTap: () async {
//                     await Clipboard.setData(ClipboardData(text: widget.code));
//                    await HapticFeedback.lightImpact();
//                     ScaffoldMessenger.of(
//                       context,
//                     ).showSnackBar(const SnackBar(content: Text("Copied")));
//                   },
//
//                   child: const Icon(Icons.copy, color: Colors.white, size: 20),
//                 ),
//               ],
//             ),
//           ),
//
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//
//             padding: const EdgeInsets.all(16),
//
//             child: RichText(text: highlighted),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_highlight/flutter_highlight.dart';

import 'package:flutter_highlight/themes/github.dart';

import 'package:my_store/core/theme/color_extension.dart';

import '../../../../../core/utils/app_text_style.dart';

class CodeBlockWidget extends StatelessWidget {
  final String code;

  final String language;

  const CodeBlockWidget({
    super.key,

    required this.code,

    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,

        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

            decoration: BoxDecoration(
              color: context.disabled,

              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),

                topRight: Radius.circular(16),
              ),
            ),

            child: Row(
              children: [
                Text(
                  language,

                  style: AppTextStyle.medium(fontSize: 14, color: Colors.white),
                ),

                const Spacer(),

                InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: code));

                    await HapticFeedback.lightImpact();

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Copied")));
                  },

                  child: const Icon(Icons.copy, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            padding: const EdgeInsets.all(16),

            child: HighlightView(
              code,

              language: language.isEmpty ? 'dart' : language,

              theme: githubTheme,

             // textStyle: AppTextStyle.medium(fontSize: 14, color: context.textPrimary), ,
            ),
          ),
        ],
      ),
    );
  }
}
