import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common_widgets/custom_cached_image_widget.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/spacing.dart';
import '../../cubit/recommenation_cubit.dart';
import '../../cubit/recommenation_state.dart';

class RecommendationProductWidget extends StatelessWidget {
  const RecommendationProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationCubit, RecommendationState>(
      builder: (context, state) {
        if (state is RecommendationLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RecommendationSuccess) {
          if (state.products.isEmpty) {
            return const Text("No Recommendations");
          }
          return SizedBox(
            height: 280,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                final product = state.products[index];
                return Container(
                  width: 190,
                  decoration: BoxDecoration(
                    color: context.surfaceColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: context.border),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),

                          child: CustomNetworkImage(
                            imageUrl: product.thumbnail ?? "",
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              product.title ?? "",

                              maxLines: 1,

                              overflow: TextOverflow.ellipsis,

                              style: AppTextStyle.semiBold(
                                fontSize: 16,

                                color: context.textPrimary,
                              ),
                            ),

                            verticalSpace(6),

                            Text(
                              product.description ?? "",

                              maxLines: 2,

                              overflow: TextOverflow.ellipsis,

                              style: AppTextStyle.regular(
                                fontSize: 13,

                                color: context.disabled,
                              ),
                            ),

                            verticalSpace(10),

                            Text(
                              '\$${product.variants?[0].price ?? 0}',

                              style: AppTextStyle.bold(
                                fontSize: 18,

                                color: context.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },

              separatorBuilder: (context, index) {
                return horizontalSpace(14);
              },

              itemCount: state.products.length,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
