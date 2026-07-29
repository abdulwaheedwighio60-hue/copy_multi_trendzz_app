import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/model/onboarding_model.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _pages =  [
    OnboardingModel(
      image: 'assets/images/get_started_image.png',
      redTitle: AppStrings.redTitle,
      blackTitle: AppStrings.blackTitle,
      description:
      AppStrings.descriptionString,
    ),
    OnboardingModel(
      image: 'assets/images/get_started_image.png',
      redTitle: AppStrings.redTitle1,
      blackTitle: AppStrings.blackTitle1,
      description:
      AppStrings.blackTitle1,
    ),
    OnboardingModel(
      image: 'assets/images/get_started_image.png',
      redTitle: AppStrings.redTitle2,
      blackTitle: AppStrings.blackTitle2,
      description:
      AppStrings.descriptionText2,
    ),
  ];

  void _onNext() {
    if (_currentPage == _pages.length - 1) {
      // TODO: Navigate to next screen
      // Navigator.pushReplacementNamed(context, Routes.welcome);
      context.go(AppRoutes.loginScreen);
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  void _onBack() {
    if (_currentPage == 0) return;

    _pageController.previousPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  void _onSkip() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final OnboardingModel currentData = _pages[_currentPage];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              /// Skip Button
              Positioned(
                top: 18.h,
                right: 22.w,
                child: GestureDetector(
                  onTap: _onSkip,
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.all(6.w),
                    child: Text(
                      'Skip',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              /// Top Image PageView
              Positioned(
                top: 50.h,
                left: 0,
                right: 0,
                height: 360.h,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemBuilder: (context, index) {
                    return _TopImageSection(
                      image: _pages[index].image,
                    );
                  },
                ),
              ),

              /// Bottom Curved White Container
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: _BottomCurveClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 300.h,

                    /// Bottom container color white
                    color: Colors.white,

                    padding: EdgeInsets.fromLTRB(20.w, 56.h, 20.w, 12.h),
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${currentData.redTitle}\n',
                                style: AppTextStyles.headlineLarge.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w800,
                                  height: 1.20,
                                ),
                              ),
                              TextSpan(
                                text: currentData.blackTitle,
                                style: AppTextStyles.headlineLarge.copyWith(
                                  color: AppColors.darkColor,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w800,
                                  height: 1.20,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 22.h),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: Text(
                            currentData.description,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.darkColor.withOpacity(0.55),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.45,
                            ),
                          ),
                        ),

                        const Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _CircleButton(
                              icon: Icons.arrow_back,
                              isFilled: false,
                              onTap: _onBack,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                _pages.length,
                                    (index) {
                                  final bool isActive = index == _currentPage;

                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 220),
                                    curve: Curves.easeOut,
                                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                                    width: isActive ? 10.w : 8.w,
                                    height: isActive ? 10.w : 8.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isActive
                                          ? AppColors.primaryColor
                                          : AppColors.primaryColor.withOpacity(0.18),
                                    ),
                                  );
                                },
                              ),
                            ),

                            _CircleButton(
                              icon: Icons.arrow_forward,
                              isFilled: true,
                              onTap: _onNext,
                            ),
                          ],
                        ),

                        SizedBox(height: 16.h),

                        /// iPhone style bottom indicator
                        Container(
                          width: 112.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopImageSection extends StatelessWidget {
  const _TopImageSection({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        /// Red curve line behind image
        Positioned(
          left: 16.w,
          right: 16.w,
          top: 118.h,
          child: CustomPaint(
            size: Size(double.infinity, 130.h),
            painter: _RedLinePainter(),
          ),
        ),

        /// Main image
        Positioned(
          top: 8.h,
          left: 36.w,
          right: 36.w,
          bottom: 0,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.icon,
    required this.isFilled,
    required this.onTap,
  });

  final IconData icon;
  final bool isFilled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled ? AppColors.primaryColor : Colors.transparent,
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1.2,
            ),
          ),
          child: Icon(
            icon,
            color: isFilled ? Colors.white : AppColors.primaryColor,
            size: 22.sp,
          ),
        ),
      ),
    );
  }
}

class _BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    /// Screenshot jaisa curve:
    /// left/right thora neeche, center thora upar
    path.moveTo(0, 34);

    path.cubicTo(
      size.width * 0.22,
      30,
      size.width * 0.30,
      4,
      size.width * 0.50,
      0,
    );

    path.cubicTo(
      size.width * 0.70,
      4,
      size.width * 0.78,
      30,
      size.width,
      34,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _RedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.primaryColor.withOpacity(0.20)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final Path path = Path();

    path.moveTo(0, size.height * 0.50);
    path.cubicTo(
      size.width * 0.20,
      size.height * 0.05,
      size.width * 0.65,
      size.height * 0.95,
      size.width,
      size.height * 0.45,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

