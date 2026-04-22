import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common_widgets/custom_primary_button.dart';
import 'package:my_store/core/theme/color_extension.dart';
import 'package:my_store/core/utils/app_text_style.dart';
import 'package:my_store/core/utils/extension.dart';
import 'package:my_store/core/utils/routing/routers.dart';
import 'dart:async';
import 'package:confetti/confetti.dart';
import 'package:my_store/core/utils/spacing.dart';
import '../../../../bottom_nav_bar/controller/bottom_nav_cubit.dart';
import '../../../../cart/presentation/screens/step.dart';

class SuccessScreen extends StatefulWidget {
  final String orderId;

  const SuccessScreen({super.key, required this.orderId,});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _scaleController;
  late Animation<double> _scale;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 4));

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scale = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );

    _scaleController.forward();
    _confettiController.play();

    Timer(const Duration(seconds: 4), () {
      if (mounted) {
       context.pushNamedAndRemoveUntil(Routers.orderDetails,arguments:  widget.orderId);
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(

        children: [
          StepHeader(currentStep: 4, totalSteps: 4,),
         verticalSpace(40),
          Stack(
            alignment: Alignment.center,
            children: [

              ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                gravity: 0.2,
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    /// ✅ ICON
                    ScaleTransition(
                      scale: _scale,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: context.disabled,
                          shape: BoxShape.circle,
                        ),
                        child:  Icon(
                          Icons.check,
                          size: 70,
                          color: context.primaryColor,
                        ),
                      ),
                    ),

                    verticalSpace(30),

                     Text(
                      "Order Successful!",
                      style: AppTextStyle.bold(
                          fontSize: 20, color: context.primaryColor)
                    ),

                    verticalSpace( 10),

                    Text(
                      "Order ID: ${widget.orderId}",
                      style: AppTextStyle.bold(
                          fontSize: 16, color: context.textPrimary)
                    ),

                    verticalSpace(20),

                     Text(
                      "Your order has been placed successfully.\nYou can track it anytime.",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.bold(
                          fontSize: 16, color: context.textPrimary)
                    ),
                    verticalSpace(40),


                    CustomElevatedButton(
                        onPressed: (){
                          context.pushNamedAndRemoveUntil(Routers.orderDetails,arguments:  widget.orderId);

                        },
                        text: 'Track Order'),


                    verticalSpace(20),



                    TextButton(
                      onPressed: () {
                        context.read<BottomNavCubit>().changeBottomNavIndex(0);
                        context.pushNamedAndRemoveUntil(Routers.bottomNav);
                      },
                      child: const Text(
                        "Back to Home",

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}