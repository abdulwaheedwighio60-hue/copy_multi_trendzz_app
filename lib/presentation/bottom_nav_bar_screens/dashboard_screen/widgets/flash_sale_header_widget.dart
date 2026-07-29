import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class FlashSaleHeaderWidget extends StatefulWidget {
  const FlashSaleHeaderWidget({
    super.key,
    this.initialDuration = const Duration(
      hours: 2,
      minutes: 12,
      seconds: 56,
    ),
    this.onTimerFinished,
  });

  final Duration initialDuration;
  final VoidCallback? onTimerFinished;

  @override
  State<FlashSaleHeaderWidget> createState() => _FlashSaleHeaderWidgetState();
}

class _FlashSaleHeaderWidgetState extends State<FlashSaleHeaderWidget> {
  Timer? _timer;
  late Duration _remainingDuration;

  @override
  void initState() {
    super.initState();

    _remainingDuration = widget.initialDuration;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) {
        if (_remainingDuration.inSeconds <= 0) {
          timer.cancel();

          widget.onTimerFinished?.call();

          return;
        }

        setState(() {
          _remainingDuration = Duration(
            seconds: _remainingDuration.inSeconds - 1,
          );
        });
      },
    );
  }

  String _twoDigits(int value) {
    return value.toString().padLeft(2, '0');
  }

  String get _hours {
    return _twoDigits(_remainingDuration.inHours);
  }

  String get _minutes {
    return _twoDigits(_remainingDuration.inMinutes.remainder(60));
  }

  String get _seconds {
    return _twoDigits(_remainingDuration.inSeconds.remainder(60));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 6.h,
      ),
      child: Row(
        children: [
          Text(
            AppStrings.flashSale,
            style: AppTextStyles.headlineMedium.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),

          const Spacer(),

          Text(
            AppStrings.closingIn,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),

          SizedBox(width: 8.w),

          _TimeBox(value: _hours),

          const _Colon(),

          _TimeBox(value: _minutes),

          const _Colon(),

          _TimeBox(value: _seconds),
        ],
      ),
    );
  }
}

class _TimeBox extends StatelessWidget {
  const _TimeBox({
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26.w,
      height: 24.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.10),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(
        value,
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.primaryColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _Colon extends StatelessWidget {
  const _Colon();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Text(
        ':',
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.primaryColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}