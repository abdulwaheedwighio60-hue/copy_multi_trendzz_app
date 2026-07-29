import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/order_model.dart';
import 'package:multi_trendzz/core/model/track_order_model.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int selectedTabIndex = 0;

  final List<String> tabs = [
    'Active',
    'Completed',
    'Cancelled',
  ];

  final List<OrderModel> activeOrders = [
    OrderModel(
      name: 'Canon Camera',
      category: 'Electronics',
      qty: 2,
      price: 180.00,
      imageUrl: 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=200',
    ),
    OrderModel(
      name: 'Arm Chair',
      category: 'Furniture',
      qty: 2,
      price: 120.00,
      imageUrl: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=200',
    ),
    OrderModel(
      name: 'Nike Pegasus 39',
      category: 'Shoes',
      qty: 2,
      price: 90.00,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200',
    ),
    OrderModel(
      name: 'Light Brown Coat',
      category: 'Clothes',
      qty: 2,
      price: 120.00,
      imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=200',
    ),
    OrderModel(
      name: 'Wood Chair',
      category: 'Furniture',
      qty: 2,
      price: 120.00,
      imageUrl: 'https://images.unsplash.com/photo-1506439773649-6e0eb8cfb237?w=200',
    ),
  ];

  final List<OrderModel> completedOrders = [
    OrderModel(
      name: 'Running Shoes',
      category: 'Shoes',
      qty: 1,
      price: 75.00,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200',
    ),
    OrderModel(
      name: 'Smart Watch',
      category: 'Electronics',
      qty: 1,
      price: 150.00,
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=200',
    ),
  ];

  final List<OrderModel> cancelledOrders = [
    OrderModel(
      name: 'Office Chair',
      category: 'Furniture',
      qty: 1,
      price: 110.00,
      imageUrl: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=200',
    ),
  ];

  void reorderProduct(OrderModel order) {
    final Map<String, dynamic> reorderData = <String, dynamic>{
      'name': order.name,
      'category': order.category,
      'qty': order.qty,
      'price': order.price,
      'imageUrl': order.imageUrl,
      'isReorder': true,
    };

    debugPrint('REORDER DATA: $reorderData');

    context.push(
      AppRoutes.cartScreen,
      extra: reorderData,
    );
  }

  List<OrderModel> get currentOrders {
    if (selectedTabIndex == 0) {
      return activeOrders;
    }

    if (selectedTabIndex == 1) {
      return completedOrders;
    }

    return cancelledOrders;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leadingWidth: 65.w,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              top: 6.h,
              bottom: 6.h,
            ),
            child: CustomBackButtonWidget(
              onTap: () {
                if (context.canPop()) {
                  context.pop();
                }
              },
            ),
          ),
          title: Text(
            'My Orders',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 17.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: Column(
          children: [
            _buildTabs(),

            Expanded(
              child: currentOrders.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  18.h,
                  20.w,
                  24.h,
                ),
                itemCount: currentOrders.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 14.h);
                },
                itemBuilder: (context, index) {
                  final OrderModel order = currentOrders[index];

                  return _buildOrderItem(order);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderColor.withOpacity(0.6),
            width: 1.w,
          ),
        ),
      ),
      child: Row(
        children: List.generate(
          tabs.length,
              (index) {
            final bool isSelected = selectedTabIndex == index;

            return Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },
                child: Column(
                  children: [
                    SizedBox(height: 10.h),

                    Text(
                      tabs[index],
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.textSecondary,
                        fontSize: 14.sp,
                        fontWeight:
                        isSelected ? FontWeight.w800 : FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      height: 2.5.h,
                      width: isSelected ? 68.w : 0,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOrderItem(OrderModel order) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.borderColor.withOpacity(0.7),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.025),
            blurRadius: 12.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 78.w,
            height: 78.w,
            decoration: BoxDecoration(
              color: AppColors.lightColor,
              borderRadius: BorderRadius.circular(14.r),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              order.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Iconsax.gallery,
                  color: AppColors.textHint,
                  size: 28.sp,
                );
              },
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  '${order.category} | Qty. : ${order.qty.toString().padLeft(2, '0')} pcs',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 11.5.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 7.h),

                Text(
                  '\$${order.price.toStringAsFixed(2)}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),

          _buildActionButton(order),
        ],
      ),
    );
  }

  Widget _buildActionButton(OrderModel order) {
    if (selectedTabIndex == 0) {
      return SizedBox(
        height: 34.h,
        child: ElevatedButton(
          onPressed: () {
            context.push(
              AppRoutes.trackOrderScreen,
              extra: TrackOrderModel(
                productName: order.name,
                category: order.category,
                quantity: order.qty,
                price: order.price,
                imageUrl: order.imageUrl,
                expectedDeliveryDate: '03 Sep 2023',
                trackingId: 'TRK452126542',
                statuses: [
                  OrderStatusModel(
                    title: 'Order Placed',
                    dateTime: '23 Sep 2023, 04:25 PM',
                    isCompleted: true,
                    icon: Iconsax.receipt_text,
                  ),
                  OrderStatusModel(
                    title: 'In Progress',
                    dateTime: '23 Sep 2023, 03:54 PM',
                    isCompleted: true,
                    icon: Iconsax.box,
                  ),
                  OrderStatusModel(
                    title: 'Shipped',
                    dateTime: 'Expected 24 Sep 2023',
                    isCompleted: true,
                    icon: Iconsax.truck_fast,
                  ),
                  OrderStatusModel(
                    title: 'Delivered',
                    dateTime: '24 Sep 2023, 20:23',
                    isCompleted: false,
                    icon: Iconsax.box_tick,
                  ),
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.white,
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          child: Text(
            'Track Order',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      );
    }

    if (selectedTabIndex == 1) {
      return SizedBox(
        height: 34.h,
        child: OutlinedButton(
          onPressed: () {
            // reorderProduct(order);
            showReorderConfirmation(order);
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
            side: BorderSide(
              color: AppColors.primaryColor,
              width: 1.w,
            ),
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          child: Text(
            'Reorder',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primaryColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      );
    }

    return Container(
      height: 34.h,
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.10),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Text(
        'Cancelled',
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.error,
          fontSize: 11.sp,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 86.w,
              height: 86.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.10),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.bag_cross,
                color: AppColors.primaryColor,
                size: 38.sp,
              ),
            ),

            SizedBox(height: 18.h),

            Text(
              'No Orders Found',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textPrimary,
                fontSize: 17.sp,
                fontWeight: FontWeight.w800,
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              'You do not have any orders in this section yet.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontSize: 13.sp,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }




  void showReorderConfirmation(OrderModel order) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.transparent,
      isScrollControlled: true,
      builder: (BuildContext bottomSheetContext) {
        return Container(
          padding: EdgeInsets.fromLTRB(
            20.w,
            18.h,
            20.w,
            24.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 42.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),

                SizedBox(height: 22.h),

                Container(
                  width: 68.w,
                  height: 68.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.10),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Iconsax.refresh,
                    color: AppColors.primaryColor,
                    size: 34.sp,
                  ),
                ),

                SizedBox(height: 18.h),

                Text(
                  'Reorder Product?',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  'This item will be added to your cart again so you can checkout.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 14.sp,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 20.h),

                Container(
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    color: AppColors.lightColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                          order.imageUrl,
                          width: 58.w,
                          height: 58.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 58.w,
                              height: 58.w,
                              color: AppColors.white,
                              child: Icon(
                                Iconsax.gallery,
                                color: AppColors.textHint,
                                size: 24.sp,
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(width: 12.w),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textPrimary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            SizedBox(height: 4.h),

                            Text(
                              '${order.category} • Qty ${order.qty}',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(height: 4.h),

                            Text(
                              '\$${order.price.toStringAsFixed(2)}',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 22.h),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 52.h,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(bottomSheetContext).pop();
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.textPrimary,
                            side: BorderSide(
                              color: AppColors.borderColor,
                              width: 1.w,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textPrimary,
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
                            Navigator.of(bottomSheetContext).pop();
                            reorderProduct(order);
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
                            'Add to Cart',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800,
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
}