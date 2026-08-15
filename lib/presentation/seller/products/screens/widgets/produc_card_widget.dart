import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class ProductCardWidget extends StatelessWidget {
  final String name;
  final String sku;
  final double price;
  final int stock;
  final bool isActive;
  final String score;

  final ValueChanged<bool> onStatusChanged;
  final VoidCallback onEdit;
  final VoidCallback onMore;

  const ProductCardWidget({
    super.key,
    required this.name,
    required this.sku,
    required this.price,
    required this.stock,
    required this.isActive,
    required this.score,
    required this.onStatusChanged,
    required this.onEdit,
    required this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.025),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [

          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              // Product Image
              Container(
                width: 72.w,
                height: 72.w,
                decoration: BoxDecoration(
                  color: const Color(0xffF4F5F7),
                  borderRadius:
                  BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.image_outlined,
                  size: 30.sp,
                  color: Colors.grey.shade400,
                ),
              ),

              SizedBox(width: 11.w),

              // Product Information
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      name,
                      maxLines: 2,
                      overflow:
                      TextOverflow.ellipsis,
                      style:
                      AppTextStyles.bodyMedium
                          .copyWith(
                        fontWeight:
                        FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      'SKU: $sku',
                      maxLines: 1,
                      overflow:
                      TextOverflow.ellipsis,
                      style:
                      AppTextStyles.bodySmall
                          .copyWith(
                        color:
                        Colors.grey.shade600,
                      ),
                    ),

                    SizedBox(height: 7.h),

                    Row(
                      children: [

                        Text(
                          'Rs. ${price.toStringAsFixed(0)}',
                          style:
                          AppTextStyles.bodyMedium
                              .copyWith(
                            color:
                            AppColors.primaryColor,
                            fontWeight:
                            FontWeight.w800,
                          ),
                        ),

                        SizedBox(width: 10.w),

                        Container(
                          padding:
                          EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            color: stock == 0
                                ? Colors.red
                                .withOpacity(.08)
                                : Colors.green
                                .withOpacity(.08),
                            borderRadius:
                            BorderRadius.circular(
                              6.r,
                            ),
                          ),
                          child: Text(
                            'Stock: $stock',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight:
                              FontWeight.w700,
                              color: stock == 0
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                onSelected: (value) {
                  if (value == 'edit') {
                    onEdit();
                  }
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  PopupMenuItem(
                    value: 'duplicate',
                    child: Text('Duplicate'),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
                child: Icon(
                  Icons.more_vert,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Divider(
            height: 1,
            color: Colors.grey.shade200,
          ),

          SizedBox(height: 10.h),

          // Bottom information
          Row(
            children: [

              Expanded(
                child: _infoItem(
                  icon: Icons.circle,
                  title: 'Status',
                  value: isActive
                      ? 'Active'
                      : 'Inactive',
                  valueColor: isActive
                      ? Colors.green
                      : Colors.grey,
                ),
              ),

              Expanded(
                child: _infoItem(
                  icon: Icons.star_outline,
                  title: 'Content Score',
                  value: score,
                  valueColor: Colors.orange,
                ),
              ),

              Switch.adaptive(
                value: isActive,
                activeColor:
                AppColors.primaryColor,
                onChanged: onStatusChanged,
              ),
            ],
          ),

          SizedBox(height: 5.h),

          // Actions
          Row(
            children: [

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit_outlined,
                    size: 16,
                  ),
                  label: const Text('Edit'),
                  style:
                  OutlinedButton.styleFrom(
                    foregroundColor:
                    AppColors.primaryColor,
                    side: BorderSide(
                      color:
                      AppColors.primaryColor,
                    ),
                    minimumSize:
                    Size(double.infinity, 40.h),
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                        9.r,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 8.w),

              SizedBox(
                width: 45.w,
                height: 40.h,
                child: OutlinedButton(
                  onPressed: onMore,
                  style:
                  OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                        9.r,
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem({
    required IconData icon,
    required String title,
    required String value,
    required Color valueColor,
  }) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: TextStyle(
            fontSize: 9.sp,
            color: Colors.grey.shade600,
          ),
        ),

        SizedBox(height: 3.h),

        Row(
          children: [
            Icon(
              icon,
              size: 9.sp,
              color: valueColor,
            ),
            SizedBox(width: 4.w),
            Flexible(
              child: Text(
                value,
                overflow:
                TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: valueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}