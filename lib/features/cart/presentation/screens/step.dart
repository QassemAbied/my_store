import 'package:flutter/material.dart';

class StepHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepHeader({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    final titles = ["Address", "Shipping", "Payment", "Order"];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(totalSteps, (index) {
          final step = index + 1;

          return Column(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: step == currentStep
                    ? Colors.orange
                    : Colors.grey.shade300,
                child: Text(
                  "$step",
                  style: TextStyle(
                    color: step == currentStep
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                titles[index],
                style: const TextStyle(fontSize: 12),
              ),
            ],
          );
        }),
      ),
    );
  }
}