import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class ProductImagesWidget extends StatefulWidget {
  const ProductImagesWidget({super.key});

  @override
  State<ProductImagesWidget> createState() => _ProductImagesWidgetState();
}

class _ProductImagesWidgetState extends State<ProductImagesWidget> {

  final ImagePicker _picker = ImagePicker();
  File? _coverImage;
  final List<File> _images = [];

  Future<void> _pickCoverImage()async{
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if(image != null){
      setState(() {
        _coverImage = File(image.path);
      });
    }
  }

  Future<void> _pickMoreImages()async{
    final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 80
    );

    if(images.isEmpty) return;
    setState(() {
      final remaining = 10 - _images.length;
      _images.addAll(
        images.take(remaining).map((e)=> File(e.path))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Heading
          Text(
            "Product Images",
            style: AppTextStyles.titleMedium,
          ),

          SizedBox(height: 5.h),

          Text(
            "Upload clear and attractive product images.",
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 20.h),

          /// Cover Image
          InkWell(
            onTap: _pickCoverImage,
            borderRadius: BorderRadius.circular(18.r),
            child: Container(
              height: 220.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(
                  color: AppColors.primaryColor.withOpacity(.25),
                  width: 1.5,
                ),
              ),
              child: _coverImage == null
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70.w,
                    height: 70.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Iconsax.gallery_add,
                      color: AppColors.primaryColor,
                      size: 34.sp,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    "Tap to Upload Cover Image",
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "PNG, JPG • Max 5 MB",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: Image.file(
                  _coverImage!,
                  width: double.infinity,
                  height: 220.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SizedBox(height: 25.h),

          Text(
            "More Images",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 15.h),

          SizedBox(
            height: 90.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount:
              _images.length < 10 ? _images.length + 1 : _images.length,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {

                /// Add Button
                if (index == _images.length && _images.length < 10) {
                  return InkWell(
                    onTap: _pickMoreImages,
                    borderRadius: BorderRadius.circular(16.r),
                    child: Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.primaryColor,
                        size: 34.sp,
                      ),
                    ),
                  );
                }

                /// Selected Image
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.file(
                        _images[index],
                        width: 90.w,
                        height: 90.h,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      top: 5,
                      right: 5,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _images.removeAt(index);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          SizedBox(height: 15.h),

          Text(
            "${_images.length}/10 Images Selected",
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}