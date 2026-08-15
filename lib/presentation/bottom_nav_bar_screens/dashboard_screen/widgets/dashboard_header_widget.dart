import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';

class BuyerDashboardHeaderWidget extends StatelessWidget {
  const BuyerDashboardHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 12.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ================= TOP ROW =================
              Row(
                children: [
                  /// PROFILE
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: AppColors.lightColor,
                    child: Icon(
                      Iconsax.user,
                      color: AppColors.primaryColor,
                      size: 24.sp,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  /// USER INFO
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning 👋",
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.white70,
                            fontSize: 13.sp,
                          ),
                        ),

                        SizedBox(height: 3.h),

                        Text(
                          "Welcome to Multi Trendzz",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// NOTIFICATION
                  InkWell(
                    onTap: () {
                      context.push(
                        AppRoutes.notificationScreen,
                      );
                    },
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      width: 46.w,
                      height: 46.w,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        CupertinoIcons.bell_fill,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              /// ================= TITLE =================
              Text(
                "Buyer Dashboard",
                style: AppTextStyles.bodyLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ),

              SizedBox(height: 5.h),

              Text(
                "Discover products and shop your favorite items.",
                style: AppTextStyles.bodyLarge.copyWith(
                  color: Colors.white70,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 22.h),

              /// ================= SEARCH + CART =================
              Row(
                children: [
                  /// SEARCH
                  Expanded(
                    child: SizedBox(
                      height: 48.h,
                      child: CustomTextFormFieldWidget(
                        fillColor: Colors.white,
                        hintText: "Search Products",
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: AppColors.primaryColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  /// CART
                  InkWell(
                    onTap: () {
                      /// Navigate to Cart Screen
                      ///
                      /// Example:
                      /// context.push(
                      ///   AppRoutes.cartScreen,
                      /// );
                    },
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Iconsax.shopping_cart,
                            color: AppColors.primaryColor,
                            size: 22.sp,
                          ),

                          /// CART BADGE
                          Positioned(
                            top: 5.h,
                            right: 5.w,
                            child: Container(
                              width: 16.w,
                              height: 16.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                              ),
                              child: Text(
                                "2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:multi_trendzz/core/constants/app_colors.dart';
//
// class DashboardHeaderWidget extends StatelessWidget {
//   const DashboardHeaderWidget({super.key, });
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//
//     final bool isDesktop = width >= 1100;
//     final bool isTablet = width >= 700 && width < 1100;
//     final bool isMobile = width < 700;
//
//     return Container(
//       height: isDesktop ? 72 : 65,
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isDesktop ? 25 : 16,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border(
//           bottom: BorderSide(
//             color: Colors.grey.shade200,
//           ),
//         ),
//       ),
//       child: Row(
//         children: [
//
//           /// SEARCH
//           _buildSearchBox(isDesktop, isTablet),
//
//           const Spacer(),
//
//           /// CREATE BUTTON
//           _buildCreateButton(isMobile),
//
//           SizedBox(width: isDesktop ? 22 : 12),
//
//           /// NOTIFICATION
//           _buildIconButton(
//             Icons.notifications_none,
//                 () {},
//           ),
//
//           SizedBox(width: isDesktop ? 18 : 10),
//
//           /// EDIT
//           _buildIconButton(
//             Icons.edit_outlined,
//                 () {},
//           ),
//
//           SizedBox(width: isDesktop ? 20 : 12),
//
//           /// PROFILE
//           CircleAvatar(
//             backgroundColor: AppColors.primaryColor,
//             radius: isDesktop ? 18 : 16,
//             backgroundImage: const NetworkImage(
//               "https://i.pravatar.cc/150?img=12",
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSearchBox(
//       bool isDesktop,
//       bool isTablet,
//       ) {
//
//     return Container(
//       width: isDesktop
//           ? 370
//           : isTablet
//           ? 300
//           : 180,
//
//       height: 42,
//
//       decoration: BoxDecoration(
//         color: const Color(0xffF7F7F8),
//         borderRadius: BorderRadius.circular(10),
//       ),
//
//       child: TextField(
//
//         style: TextStyle(
//           fontSize: isDesktop ? 13 : 12,
//         ),
//
//         decoration: InputDecoration(
//
//           hintText: "Search or type a command",
//
//           hintStyle: const TextStyle(
//             color: Color(0xff8B8B8B),
//             fontSize: 13,
//           ),
//
//           prefixIcon: const Icon(
//             Icons.search,
//             size: 20,
//             color: Colors.black54,
//           ),
//
//           border: InputBorder.none,
//
//           contentPadding: const EdgeInsets.only(
//             top: 12,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCreateButton(bool isMobile) {
//     return SizedBox(
//       height: 40,
//       child: ElevatedButton.icon(
//         onPressed: () {},
//
//         icon: const Icon(
//           Icons.add,
//           color: Colors.white,
//           size: 16,
//         ),
//
//         label: Text(
//           isMobile ? "Add" : "Create",
//           style: const TextStyle(
//             fontSize: 13,
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//
//         style: ElevatedButton.styleFrom(
//           elevation: 0,
//           backgroundColor:AppColors.primaryColor,
//
//           padding: const EdgeInsets.symmetric(
//             horizontal: 18,
//           ),
//
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildIconButton(IconData icon, VoidCallback onTap,) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(30),
//       child: Container(
//         width: 36,
//         height: 36,
//         alignment: Alignment.center,
//         child: Icon(
//           icon,
//           size: 24,
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }
// }