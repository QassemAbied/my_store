import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class CartListShimmer extends StatelessWidget {
  const CartListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const CartItemShimmer();
        },
      ),
    );
  }
}
class CartItemShimmer extends StatelessWidget {
  const CartItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [

            /// 🖼️ صورة وهمية
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            const SizedBox(width: 12),

            /// 📦 نصوص وهمية
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: 14,
                    width: 120,
                    color: Colors.grey,
                  ),

                  const SizedBox(height: 8),

                  Container(
                    height: 12,
                    width: 80,
                    color: Colors.grey,
                  ),

                  const SizedBox(height: 10),

                  Container(
                    height: 12,
                    width: 100,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}