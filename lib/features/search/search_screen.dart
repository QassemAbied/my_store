import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/search/search_body.dart';
import '../../core/theme/color_extension.dart';
import '../../injection_container.dart';
import 'controller/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.surfaceColor,
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: BlocProvider(
        create: (context) => sl<SearchCubit>(),
        child: SearchBody(),
      ),
    );
  }
}