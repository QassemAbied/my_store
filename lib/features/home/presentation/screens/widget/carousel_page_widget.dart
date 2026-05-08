import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/common_widgets/custom_cached_image_widget.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/spacing.dart';

class CarouselPageWidget extends StatefulWidget {
  const CarouselPageWidget({super.key});

  @override
  State<CarouselPageWidget> createState() => _CarouselPageWidgetState();
}

class _CarouselPageWidgetState extends State<CarouselPageWidget> {
  final CarouselSliderController bannerController = CarouselSliderController();
  int currentIndex = 0;
  List<String> imageList = [
    'https://images.unsplash.com/photo-1522199755839-a2bacb67c546',
    'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
    'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CarouselSlider.builder(
            carouselController: bannerController,
            options: CarouselOptions(
              viewportFraction: 1,
              scrollDirection: Axis.horizontal,
              // autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            itemCount: imageList.length,
            itemBuilder: (context, index, realIndex) {
              return CustomNetworkImage(
                imageUrl: imageList[index],
                width: double.infinity,
              );
            },
          ),
          verticalSpace(10),
          AnimatedSmoothIndicator(
            count: imageList.length,
            axisDirection: Axis.horizontal,
            effect: ExpandingDotsEffect(
                dotColor: context.border,
                activeDotColor: context.primaryColor,
             dotHeight: 10,
              dotWidth: 10,

            ),
            activeIndex: currentIndex,
          ),
        ],
      ),
    );
  }
}
