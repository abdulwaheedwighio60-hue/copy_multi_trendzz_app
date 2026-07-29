import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/cart_item_model.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/cart/widgets/QuantityButtonWIdget.dart';
import 'package:shimmer/shimmer.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  final CartItemModel item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  Future<bool?> _showRemoveCartBottomSheet(
      BuildContext context,
      ) {
    return showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.black.withOpacity(0.35),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SafeArea(
          top: false,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              20.w,
              18.h,
              20.w,
              22.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(28.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.08),
                  blurRadius: 24.r,
                  offset: Offset(0, -8.h),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Remove from Cart?',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 18.h),

                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: AppColors.dividerColor,
                ),

                SizedBox(height: 18.h),

                Row(
                  children: [
                    Container(
                      width: 82.w,
                      height: 82.w,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: _buildCartProductImage(item.imagePath),
                      ),
                    ),
                    SizedBox(width: 14.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          SizedBox(height: 5.h),

                          Text(
                            item.category,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          SizedBox(height: 8.h),

                          Text(
                            '\$${item.totalPrice.toStringAsFixed(2)}',
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        QuantityButton(
                          icon: Icons.remove,
                          backgroundColor:
                          AppColors.greyColor.withOpacity(0.08),
                          iconColor: AppColors.textPrimary,
                          onTap: () {},
                        ),

                        SizedBox(width: 10.w),

                        Text(
                          item.quantity.toString(),
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textPrimary,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        SizedBox(width: 10.w),

                        QuantityButton(
                          icon: Icons.add,
                          backgroundColor: AppColors.primaryColor,
                          iconColor: AppColors.white,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 26.h),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 52.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            AppColors.greyColor.withOpacity(0.08),
                            foregroundColor: AppColors.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: SizedBox(
                        height: 52.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                          child: Text(
                            'Yes, Remove',
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.title),
      direction: DismissDirection.endToStart,

      // Important:
      // Swipe par direct remove nahi hoga.
      // Pehle bottom sheet show hogi.
      confirmDismiss: (DismissDirection direction) async {
        final bool? shouldRemove =
        await _showRemoveCartBottomSheet(context);

        if (shouldRemove == true) {
          onRemove();
        }

        // false return karne se Dismissible item khud remove nahi karega.
        // Remove ka control parent list ke onRemove/setState ke paas rahega.
        return false;
      },

      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 24.w),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Icon(
          Iconsax.trash,
          color: AppColors.primaryColor,
          size: 26.sp,
        ),
      ),

      child: Container(
        color: AppColors.lightColor,
        child: Row(
          children: [
            Container(
              width: 82.w,
              height: 82.w,
              decoration: BoxDecoration(
                color: AppColors.greyColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: _buildCartProductImage(item.imagePath),
              ),
            ),

            SizedBox(width: 14.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: 5.h),

                  Text(
                    item.category,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    '\$${item.totalPrice.toStringAsFixed(2)}',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 10.w),

            Row(
              children: [
                QuantityButton(
                  icon: Icons.remove,
                  backgroundColor: AppColors.greyColor.withOpacity(0.08),
                  iconColor: AppColors.textPrimary,
                  onTap: onDecrease,
                ),

                SizedBox(width: 10.w),

                Text(
                  item.quantity.toString(),
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(width: 10.w),

                QuantityButton(
                  icon: Icons.add,
                  backgroundColor: AppColors.primaryColor,
                  iconColor: AppColors.white,
                  onTap: onIncrease,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartProductImage(String imagePath) {
    final bool isNetworkImage = imagePath.startsWith('http');

    if (isNetworkImage) {
      return Image.network(
        imagePath,
        fit: BoxFit.cover,
        loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
            ) {
          if (loadingProgress == null) {
            return child;
          }

          return _buildImageShimmer();
        },
        errorBuilder: (
            BuildContext context,
            Object error,
            StackTrace? stackTrace,
            ) {
          return Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              color: AppColors.textHint,
              size: 28.sp,
            ),
          );
        },
      );
    }

    return Image.asset(
      imagePath,
      fit: BoxFit.contain,
    );
  }

  Widget _buildImageShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.borderColor.withOpacity(0.45),
      highlightColor: AppColors.white.withOpacity(0.95),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.white,
      ),
    );
  }
}