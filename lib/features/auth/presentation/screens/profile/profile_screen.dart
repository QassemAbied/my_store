import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/auth/presentation/screens/profile/widget/profile_header_widget.dart';
import 'package:my_store/features/auth/presentation/screens/profile/widget/profile_info_widget.dart';
import '../../../../../core/utils/spacing.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
          if (state is ProfileSuccess) {
            final user = state.customerEntity;

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ProfileHeader(user: user),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      verticalSpace(20),
                      ProfileInfoCard(user: user),
                    ]),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
