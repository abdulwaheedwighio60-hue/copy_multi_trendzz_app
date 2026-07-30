import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

import '../../../core/constants/app_colors.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final actions = [

      {
        "title":"Users",
        "icon":Iconsax.profile_2user,
        "color":Colors.blue,
      },

      {
        "title":"Sellers",
        "icon":Iconsax.shop,
        "color":Colors.orange,
      },

      {
        "title":"Products",
        "icon":Iconsax.box,
        "color":Colors.green,
      },

      {
        "title":"Orders",
        "icon":Iconsax.shopping_cart,
        "color":Colors.purple,
      },

      {
        "title":"Reports",
        "icon":Iconsax.chart_2,
        "color":Colors.teal,
      },

      {
        "title":"Settings",
        "icon":Iconsax.setting_2,
        "color":Colors.red,
      },

    ];

    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 3;

    if(width >= 1200){

      crossAxisCount = 6;

    }else if(width >= 700){

      crossAxisCount = 4;

    }

    return Container(

      padding: EdgeInsets.all(20.w),

      decoration: BoxDecoration(

        color: AppColors.white,

        borderRadius: BorderRadius.circular(18.r),

        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(.05),

            blurRadius: 15,

            offset: const Offset(0,4),

          )

        ],

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            "Quick Actions",
            style: AppTextStyles.titleLarge,
          ),

          SizedBox(height:20.h),

          GridView.builder(

            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),

            itemCount: actions.length,

            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: crossAxisCount,

              crossAxisSpacing:16,

              mainAxisSpacing:16,

              childAspectRatio:.95,

            ),

            itemBuilder: (_,index){

              final item = actions[index];

              return InkWell(

                borderRadius: BorderRadius.circular(16.r),

                onTap: (){

                  /// Navigate Later

                },

                child: Container(

                  decoration: BoxDecoration(

                    color: (item["color"] as Color).withOpacity(.10),

                    borderRadius:
                    BorderRadius.circular(16.r),

                  ),

                  child: Column(

                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [

                      Container(

                        height:55,

                        width:55,

                        decoration: BoxDecoration(

                          color:item["color"] as Color,

                          shape: BoxShape.circle,

                        ),

                        child: Icon(

                          item["icon"] as IconData,

                          color: Colors.white,

                          size:28,

                        ),

                      ),

                      SizedBox(height:14.h),

                      Text(

                        item["title"] as String,

                        style:
                        AppTextStyles.bodyMedium.copyWith(

                          color:
                          AppColors.textPrimary,

                          fontWeight:
                          FontWeight.w600,

                        ),

                      )

                    ],

                  ),

                ),

              );

            },

          ),

        ],

      ),

    );

  }

}