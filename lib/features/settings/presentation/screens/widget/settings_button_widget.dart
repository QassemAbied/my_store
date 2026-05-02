import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/routing/routers.dart';
import '../../../../auth/presentation/cubit/auth_cubit.dart';

class SettingsButtonWidget extends StatelessWidget {
  const SettingsButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () async{
        context.read<AuthCubit>().logout();
        context.pushNamedAndRemoveUntil(Routers.login);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: Text(
        "Logout",
        style: AppTextStyle.bold(
          fontSize: 16,
          color: context.onPrimaryColor,
        ),
      ),
    );
  }
}
