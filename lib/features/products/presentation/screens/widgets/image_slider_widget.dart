import 'package:flutter/material.dart';
import 'package:my_store/core/utils/extension.dart';
import '../../../../../core/common_widgets/custom_cached_image_widget.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../domain/entities/product_details_entities.dart';

class ImageSliderWidget extends StatefulWidget {
  final ProductDetailsEntities product;
  const ImageSliderWidget({super.key, required this.product});

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final images = widget.product.product.images;
    return  Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: images.length,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          itemBuilder: (_, index) {
            return CustomNetworkImage(
              imageUrl: images[index].url,
              fit: BoxFit.cover,
              enableHero: true,
              heroTag: images[index].url,
            );
          },
        ),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => context.pop(),
                    child: _IconBtn(Icons.arrow_back)),
                _IconBtn(Icons.favorite_border),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              final isActive = index == currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: isActive ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive
                      ? context.primaryColor
                      : context.primaryColor.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;

  const _IconBtn(this.icon);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.primaryColor.withValues(alpha: .3),
      child: Icon(icon, color: context.primaryColor),
    );
  }
}

