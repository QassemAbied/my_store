import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OrderShimmerItem extends StatelessWidget {
  const OrderShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(height: 16, width: 100, color: Colors.white),

            const SizedBox(height: 10),

            Container(height: 12, width: 150, color: Colors.white),

            const SizedBox(height: 12),

            Row(
              children: List.generate(
                3,
                    (index) => Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 60,
                  height: 60,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Container(height: 14, width: 80, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class OrdersShimmerList extends StatelessWidget {
  const OrdersShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (_, _) => const OrderShimmerItem(),
    );
  }
}