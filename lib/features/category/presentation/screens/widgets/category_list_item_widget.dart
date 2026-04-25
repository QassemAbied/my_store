import 'package:flutter/material.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../domain/entities/category_entities.dart';

class CategoryListItemWidget extends StatelessWidget {
  const CategoryListItemWidget({
    super.key,
    required this.categories,
   required this.selectedId,
    required this.onSelect,
  });
  final CategoryEntities categories;
  final String? selectedId;
  final Function(String) onSelect;
  @override
  Widget build(BuildContext context) {
    final isSelected = categories.id == selectedId;
    return GestureDetector(
      onTap: () => onSelect(categories.id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    context.secondaryColor,
                    context.primaryColor.withValues(alpha: 0.7),
                  ],
                )
              : null,
          color: isSelected ? null : context.surfaceColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: context.border),
        ),
        child: Center(
          child: Text(
            categories.name,
            style: AppTextStyle.medium(
              fontSize: 13,
              color: isSelected ? context.onPrimaryColor : context.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
