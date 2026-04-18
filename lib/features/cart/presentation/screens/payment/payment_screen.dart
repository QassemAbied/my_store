import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart/presentation/screens/success/success_screen.dart';
import 'package:my_store/features/shipping/presentation/controller/shipping_cubit.dart';

import '../step.dart';

import 'package:flutter/material.dart';
import 'dart:math';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  final cardController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  bool isBack = false;

  /// ================= FORMAT =================
  String formatCardNumber(String input) {
    input = input.replaceAll(' ', '');

    final buffer = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      buffer.write(input[i]);
      if ((i + 1) % 4 == 0 && i != input.length - 1) {
        buffer.write(' ');
      }
    }
    return buffer.toString();
  }

  /// ================= DETECT =================
  String detectCardType(String number) {
    if (number.startsWith('4')) return "visa";
    if (number.startsWith('5')) return "master";
    return "unknown";
  }

  Widget cardIcon(String number) {
    final type = detectCardType(number);

    if (type == "visa") {
      return const Icon(Icons.credit_card, color: Colors.red);
    } else if (type == "master") {
      return const Icon(Icons.credit_card, color: Colors.red);
    } else {
      return const Icon(Icons.credit_card, color: Colors.red);
    }
  }

  /// ================= CARD =================
  Widget creditCard() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        final rotate = Tween(begin: pi, end: 0.0).animate(animation);
        return AnimatedBuilder(
          animation: rotate,
          child: child,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.rotationY(rotate.value),
              alignment: Alignment.center,
              child: child,
            );
          },
        );
      },
      child: isBack ? cardBack() : cardFront(),
    );
  }

  Widget cardFront() {
    return Container(
      key: const ValueKey("front"),
      height: 200,
      width: double.infinity,
      decoration: cardDecoration(),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("CARD",
                  style: TextStyle(color: Colors.white70)),
              cardIcon(cardController.text),
            ],
          ),

          const Spacer(),

          Text(
            cardController.text.isEmpty
                ? "**** **** **** 1234"
                : cardController.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                expiryController.text.isEmpty
                    ? "MM/YY"
                    : expiryController.text,
                style: const TextStyle(color: Colors.white),
              ),
              const Text("VISA",
                  style: TextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }

  Widget cardBack() {
    return Container(
      key: const ValueKey("back"),
      height: 200,
      width: double.infinity,
      decoration: cardDecoration(),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [

          Container(
            height: 40,
            color: Colors.black87,
          ),

          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 80,
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: Text(
                cvvController.text.isEmpty ? "***" : cvvController.text,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration cardDecoration() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xff6D5DF6), Color(0xffA084E8)],
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.deepPurple.withOpacity(0.3),
          blurRadius: 20,
        )
      ],
    );
  }

  /// ================= FIELD =================
  Widget field(String hint, TextEditingController controller,
      {bool isCvv = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        onTap: () {
          if (isCvv) {
            setState(() => isBack = true);
          } else {
            setState(() => isBack = false);
          }
        },
        onChanged: (value) {
          if (controller == cardController) {
            final formatted = formatCardNumber(value);

            controller.value = TextEditingValue(
              text: formatted,
              selection:
              TextSelection.collapsed(offset: formatted.length),
            );
          }
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }

  /// ================= BUILD =================
  @override
  Widget build(BuildContext context) {
    final isValid = cardController.text.isNotEmpty &&
        expiryController.text.isNotEmpty &&
        cvvController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 💳 CARD
            creditCard(),

            const SizedBox(height: 25),

            /// 💳 INPUTS
            field("Card Number", cardController),

            Row(
              children: [
                Expanded(
                    child: field("Expiry", expiryController)),
                const SizedBox(width: 10),
                Expanded(
                    child: field("CVV", cvvController, isCvv: true)),
              ],
            ),

            const Spacer(),

            /// 🔥 BUTTON
            GestureDetector(
              onTap: isValid ? () {} : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: isValid
                      ? const LinearGradient(
                    colors: [
                      Color(0xff6D5DF6),
                      Color(0xffA084E8)
                    ],
                  )
                      : null,
                  color: isValid ? null : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "Pay Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}Widget modernField(String hint, TextEditingController controller) {
  return Container(
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.6),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
      ),
    ),
  );
}