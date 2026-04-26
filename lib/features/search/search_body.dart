import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/search/controller/search_cubit.dart';
import 'package:my_store/features/search/widget/empty_search_widget.dart';
import '../../core/common_widgets/custom_grid_view/product_grid_loading_widget.dart';
import '../../core/common_widgets/custom_grid_view/product_grid_view_widget.dart';
import '../../core/common_widgets/custom_text_form_field.dart';
import 'controller/search_state.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey cartKey = GlobalKey();
  Timer? _debounce;

  @override
  void dispose() {
    controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      final cubit = context.read<SearchCubit>();
      cubit.search(query: value);
    });
  }
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: CustomTextFormField(
            controller: controller,
            textInputType: TextInputType.webSearch,
            onChanged: _onSearchChanged,
            hintText: "Search products...",
            prefixIcon: const Icon(Icons.search),
            suffix: IconButton(
              onPressed: () {
                controller.clear();
                controller.text.isEmpty;

                setState(() {

                });
              },
              icon: Icon(Icons.clear),),

          ),),

        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if(state is SearchInitial){
                return onSearchEmpty();
              }
              if (state is SearchLoading) {
                return const ProductsGridShimmer();
              }
              if (state is SearchFailure) {
                return Center(child: Text(state.toString()));
              }


              if (state is SearchSuccess) {
                return controller.text.isEmpty?
                onSearchEmpty()
                    :state.searchProduct.isEmpty?
                onSearchEmpty()
                    :ProductListViewWidget(
                  product: state.searchProduct,
                  cartKey: cartKey,
                );
              }



              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
  Widget onSearchEmpty(){
     return EmptySearchView(query: controller.text,onClear: (){
      controller.clear();
      setState(() {

      });
    },);
  }
}
