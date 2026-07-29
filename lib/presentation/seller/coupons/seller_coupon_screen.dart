import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/presentation/seller/coupons/widgets/coupons_empty_widget.dart';
import 'package:multi_trendzz/presentation/seller/coupons/widgets/coupons_stats_widget.dart';

import '../../../core/constants/app_colors.dart';

import 'widgets/coupon_header_widget.dart';
import 'widgets/coupon_summary_widget.dart';
import 'widgets/coupon_filter_widget.dart';
import 'widgets/coupon_card_widget.dart';


class SellerCouponScreen extends StatefulWidget {
  const SellerCouponScreen({super.key});

  @override
  State<SellerCouponScreen> createState() =>
      _SellerCouponScreenState();
}


class _SellerCouponScreenState extends State<SellerCouponScreen> {

  int selectedFilter = 0;

  /// Change true to test empty UI
  bool isEmpty = false;


  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(

        statusBarColor:
        AppColors.primaryColor,

        statusBarIconBrightness:
        Brightness.light,

        statusBarBrightness:
        Brightness.light,
      ),

      child: Scaffold(

        backgroundColor:
        const Color(0xffF7F8FA),


        body: SafeArea(

          child: Column(

            children: [

              /// Header
              CouponHeaderWidget(

                totalCoupons: 24,

                onSearchTap: () {},

                onFilterTap: () {},

                onCreateCoupon: () {

                  // Navigate Create Coupon Screen
                  context.push(AppRoutes.createCouponScreen);
                },
              ),



              Expanded(

                child: isEmpty

                    ?

                CouponEmptyWidget(

                  onCreateCoupon: () {},

                  onRefresh: () {

                    setState(() {

                      isEmpty = false;

                    });

                  },

                )


                    :

                SingleChildScrollView(

                  physics:
                  const BouncingScrollPhysics(),


                  child: Column(

                    children: [


                      const SizedBox(
                        height: 20,
                      ),



                      /// Summary Cards
                      const CouponSummaryWidget(),



                      const SizedBox(
                        height: 20,
                      ),



                      /// Filters
                      CouponFilterWidget(

                        selectedIndex:
                        selectedFilter,


                        onChanged: (index){

                          setState(() {

                            selectedFilter =
                                index;

                          });


                          // Apply Filter API Later

                        },
                      ),



                      const SizedBox(
                        height: 20,
                      ),



                      /// Statistics
                      const CouponStatsWidget(),



                      const SizedBox(
                        height: 20,
                      ),




                      /// Coupon List


                      CouponCardWidget(

                        couponCode:
                        "SUMMER50",

                        couponType:
                        CouponType.percentage,

                        discount:
                        "50% OFF",

                        validFrom:
                        "20 Jul 2026",

                        validTo:
                        "30 Jul 2026",

                        minimumOrder:
                        "\$100",

                        usedCount:
                        152,

                        status:
                        CouponStatus.active,


                        onEdit: () {},

                        onDelete: () {},

                        onView: () {
                          context.push(AppRoutes.sellerCouponDetailScreen);
                        },

                      ),




                      CouponCardWidget(

                        couponCode:
                        "SAVE20",

                        couponType:
                        CouponType.flat,

                        discount:
                        "\$20 OFF",

                        validFrom:
                        "01 Aug 2026",

                        validTo:
                        "15 Aug 2026",

                        minimumOrder:
                        "\$150",

                        usedCount:
                        87,


                        status:
                        CouponStatus.scheduled,


                        onEdit: () {},

                        onDelete: () {},

                        onView: () {},

                      ),




                      CouponCardWidget(

                        couponCode:
                        "OLD10",

                        couponType:
                        CouponType.percentage,

                        discount:
                        "10% OFF",

                        validFrom:
                        "01 Jun 2026",

                        validTo:
                        "10 Jun 2026",

                        minimumOrder:
                        "\$50",

                        usedCount:
                        230,


                        status:
                        CouponStatus.expired,


                        onEdit: () {},

                        onDelete: () {},

                        onView: () {},

                      ),



                      const SizedBox(
                        height: 30,
                      ),


                    ],
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