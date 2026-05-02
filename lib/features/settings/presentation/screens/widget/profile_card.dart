import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_state.dart';
import '../../../../../core/common_widgets/custom_animated_container_widget.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/spacing.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainerWidget(
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
          ),
          horizontalSpace(12),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProfileError) {
                return Center(child: Text(state.message));
              }
              if (state is ProfileSuccess) {
                final user = state.customerEntity;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.firstName,
                      style: AppTextStyle.bold(
                        fontSize: 16,
                        color: context.textPrimary,
                      ),
                    ),
                    Text(
                      user.email,
                      style: AppTextStyle.regular(
                        fontSize: 13,
                        color: context.textSecondary,
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
