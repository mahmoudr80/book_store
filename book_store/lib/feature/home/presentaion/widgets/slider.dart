import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late int currentIndex;
  late CarouselSliderController carouselController;

  @override
  void initState() {
    currentIndex = 0;
    carouselController = CarouselSliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is SliderSuccess ||
          current is SliderFailed || current is SliderLoading ,
      builder: (context, state) {
        if (state is SliderSuccess) {
          final sliders = state.sliderUrls
              .map((e) => Image.network(e.imgUrl, fit: BoxFit.cover))
              .toList();

          return Column(
            children: [
              CarouselSlider(
                carouselController: carouselController,
                items: sliders,
                options: CarouselOptions(
                  height: 150,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: currentIndex,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onScrolled: (value) {},
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 14.h),

              AnimatedSmoothIndicator(
                count: sliders.length,
                activeIndex: currentIndex,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColor.primaryColor,
                ),
                onDotClicked: (index) {
                  if (mounted) {
                    carouselController.animateToPage(index);

                    setState(() {
                      currentIndex = index;
                    });
                  }
                },
              ),
            ],
          );
        }
        if (state is SliderLoading) {
          return SizedBox(
            height: 200,
            width: 400,
            child: Shimmer.fromColors(baseColor:AppColor.primaryColor.withAlpha(50),
                highlightColor:Colors.white, child: Container(
                  margin: EdgeInsetsGeometry.only(left: 35.w),
              height: 200,
              width: 400,
              color: AppColor.primaryColor,
            )),
          );
        }
        else{
          return Lottie.asset(Assets.animations.notFoundJson);
        }

      },
    );
  }
}
