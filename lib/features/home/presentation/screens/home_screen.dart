import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_store/features/cart/presentation/cubit/cart_cubit.dart';
import '../../../../core/network/api_contstants.dart';
import '../../../../core/utils/extension.dart';
import '../../../../core/utils/routing/routers.dart';
import '../../../../injection_container.dart';
import '../../../products/presentation/cubit/product_details_cubit.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController=ScrollController();
  late HomeCubit _homeCubit;


  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
    _homeCubit = HomeCubit(sl());
    _homeCubit.getProduct();

  }
   void onScroll() {
   final  pixels= scrollController.position.pixels;
   final  max= scrollController.position.maxScrollExtent;

   if(pixels>=max-200){
     _homeCubit.getProduct(isLoadMore: true);
   }
   }
  @override
  void dispose() {
    _homeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeCubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return const Center(child: Text('Welcome to Home'));
            } else if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductFailure) {
              return Center(child: Text('Error: ${state.err}'));
            } else if (state is ProductSuccess) {
              final cubit = context.read<HomeCubit>();
              final products = state.product ?? [];
              return ListView.builder(
                controller: scrollController,
                itemCount: products.length +(cubit.hasMore?1:0),
                itemBuilder: (context, index) {
                  if(index==products.length){
                    return const Center(child: CircularProgressIndicator());

                  }
                  final product = products[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                    child: ListTile(
                      leading: product.thumbnail != null?
                      //     ? ClipRRect(
                      //   borderRadius: BorderRadius.circular(8),
                      //   child: Image.network(
                      //     ApiConstants.fixImageUrl(product.thumbnail ?? ""),
                      //     width: 50,
                      //     height: 50,
                      //     fit: BoxFit.cover,
                      //   ),
                      // )
                      CachedNetworkImage(
                              imageUrl: ApiConstants.fixImageUrl(product.thumbnail ?? ""),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            )
                          : const Icon(Icons.image),
                      title: Text(product.title ?? 'No Title'),
                      subtitle: Text(product.description ?? 'No Description'),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          // context.read<CartCubit>().addCart(
          //     variantId: 'variant_01KMWC9BKA8SZTM3NE9KXNC6AF',
          //     quantity: 1);
          context.read<AuthCubit>().logout();
          context.pushNamedAndRemoveUntil(Routers.login);

          // context.read<CartCubit>().updateCart(
          //     lineId: 'cali_01KNF46YPMAHY01VAJ1GHSS3ZW',
          //     quantity: 5.toInt());
          //context.read<CartCubit>().getShippingOptions();
         // context.read<CartCubit>().checkout();
        //  context.read<CartCubit>().addShippingOptions(shippingOptionId: 'so_01KMWC9BE3DEHBFF7MZGY2BFAZ');
        // context.read<CartCubit>().deleteCart(lineId: 'cali_01KNF1N25ZSNGF51H1PR0GE8TQ');
          //context.read<ProductDetailsCubit>().getProductDetails('/prod_01KMWC9BH1C7CRBBG5KER0TTAN');
         // BlocProvider(create: (context) => sl<ProductDetailsCubit>()..getProductDetails('/prod_01KMWC9BH1C7CRBBG5KER0TTAN'));
         //  context.read<AuthCubit>().registerAuth(LoginRequest(
         //      email: 'test2@gmail.com',
         //      password: '1234567'));

          // context.read<AuthCubit>().register(
          //   RegisterRequest(
          //       email: 'test2@gmail.com',
          //       password: '1234567',
          //       firstName: 'qassem',
          //       phone: '067775456',
          //       country: 'egypt'
          //   )
          // );
 // context.read<AuthCubit>().logon(LoginRequest(
 //               email: 'test2@gmail.com',
 //               password: '1234567'));
        }),
      ),
    );

  }


}
