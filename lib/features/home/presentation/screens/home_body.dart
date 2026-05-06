import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/home/presentation/screens/widget/carousel_page_widget.dart';
import 'package:my_store/features/home/presentation/screens/widget/category_at_home/category_home_widget.dart';
import 'package:my_store/features/home/presentation/screens/widget/product_grid_widget.dart';

import '../../../../core/common_widgets/custom_grid_view/product_grid_loading_widget.dart';
import '../../../../core/theme/color_extension.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../category/presentation/controller/category_cubit.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomeBody extends StatefulWidget {
  final GlobalKey cartKey;
  const HomeBody({super.key, required this.cartKey});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();

    final categoryCubit = context.read<CategoryCubit>();
    if (categoryCubit.state.categories.isEmpty) {
      categoryCubit.getCategories(context);
    }

    final homeCubit = context.read<HomeCubit>();
    if (homeCubit.productList.isEmpty) {
      homeCubit.getProduct();
    }
  }
  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, homeState) {
        return CustomScrollView(
          controller: homeCubit.scrollController,
          slivers: [
            SliverToBoxAdapter(
                child: CategoryHomeWidget()
            ),
            SliverToBoxAdapter(
              child: CarouselPageWidget(),
            ),



            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Popular Products",
                  style: AppTextStyle.bold(
                    fontSize: 20,
                    color: context.textPrimary,
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 14),
            ),
            if(homeState is ProductLoading)
              SliverToBoxAdapter(child: SizedBox(
                  height: 200,
                  child: ProductsGridShimmer())),

            if (homeState is ProductSuccess)
              ProductGridWidget(
                cartKey: widget.cartKey, productItem: homeState.product,)
          ],
        );
      },
    );
  }
}
