import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/category/presentation/screens/widgets/category_list_item_widget.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../domain/entities/category_entities.dart';
import '../../controller/category_cubit.dart';

class CategoryListViewWidget extends StatelessWidget {
  final List<CategoryEntities> categories;
  final String? selectedId;

  const CategoryListViewWidget({
    super.key,
    required this.categories,
    required this.selectedId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length ,
        separatorBuilder: (_, _) => horizontalSpace(10),
        itemBuilder: (_, index) {
          final cat = categories[index];

          return CategoryListItemWidget(
            categories: cat,
            onSelect: (String id) {
              context.read<CategoryCubit>().selectCategory(id,context);
            }, selectedId: selectedId,);
        },
      ),
    );
  }
}
