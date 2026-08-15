import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';

class ProductActionButtonWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final VoidCallback onSaveDraft;

  const ProductActionButtonWidget({
    super.key,
    required this.isLoading,
    required this.onCancel,
    required this.onSave,
    required this.onSaveDraft,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          12.w,
          10.h,
          12.w,
          10.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          children: [

            Expanded(
              child: OutlinedButton(
                onPressed:
                isLoading ? null : onCancel,
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(
                    double.infinity,
                    46.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(11.r),
                  ),
                  side: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: const Text('Cancel'),
              ),
            ),

            SizedBox(width: 7.w),

            Expanded(
              child: OutlinedButton(
                onPressed:
                isLoading ? null : onSaveDraft,
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(
                    double.infinity,
                    46.h,
                  ),
                  foregroundColor:
                  AppColors.primaryColor,
                  side: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(11.r),
                  ),
                ),
                child: const Text('Save Draft'),
              ),
            ),

            SizedBox(width: 7.w),

            Expanded(
              child: ElevatedButton(
                onPressed:
                isLoading ? null : onSave,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    double.infinity,
                    46.h,
                  ),
                  backgroundColor:
                  AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(11.r),
                  ),
                ),
                child: isLoading
                    ? SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child:
                  const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}