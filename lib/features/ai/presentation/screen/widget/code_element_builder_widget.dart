import 'package:flutter/widgets.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:markdown/markdown.dart' as md;
import 'code_block_widget.dart';

class CodeElementBuilder extends MarkdownElementBuilder {
  @override
  Widget visitElementAfter(
      md.Element element,
      TextStyle? preferredStyle) {
    final code = element.textContent;

    final language =
        element.attributes['class']?.replaceFirst('language-', '') ?? 'dart';

    return CodeBlockWidget(code: code, language: language);
  }
}
