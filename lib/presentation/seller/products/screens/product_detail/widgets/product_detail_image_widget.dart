import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class ProductDetailImageWidget extends StatefulWidget {
  const ProductDetailImageWidget({super.key});

  @override
  State<ProductDetailImageWidget> createState() =>
      _ProductDetailImageWidgetState();
}

class _ProductDetailImageWidgetState
    extends State<ProductDetailImageWidget> {

  final List<String> images = [

    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600",
    "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=600",
    "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=600",
    "https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=600",

  ];

  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: EdgeInsets.all(20.w),

      padding: EdgeInsets.all(16.w),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(18.r),

        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(.05),

            blurRadius: 10,

            offset: const Offset(0,5),

          ),

        ],

      ),

      child: Column(

        children: [

          /// Main Image

          Stack(

            children: [

              ClipRRect(

                borderRadius: BorderRadius.circular(18.r),

                child: Image.network(

                  images[selectedImage],

                  width: double.infinity,

                  height: 260.h,

                  fit: BoxFit.cover,

                ),

              ),

              Positioned(

                top: 12,

                right: 12,

                child: Row(

                  children: [

                    _circleButton(
                      Iconsax.heart,
                    ),

                    SizedBox(width:10.w),

                    _circleButton(
                      Iconsax.share,
                    ),

                  ],

                ),

              ),

            ],

          ),

          SizedBox(height:20.h),

          SizedBox(

            height:75.h,

            child: ListView.separated(

              scrollDirection: Axis.horizontal,

              itemCount: images.length,

              separatorBuilder: (_,__) =>
                  SizedBox(width:10.w),

              itemBuilder:(context,index){

                final selected =
                    selectedImage==index;

                return GestureDetector(

                  onTap: (){

                    setState(() {

                      selectedImage=index;

                    });

                  },

                  child: Container(

                    decoration: BoxDecoration(

                      border: Border.all(

                        color: selected
                            ? AppColors.primaryColor
                            : Colors.transparent,

                        width:2,

                      ),

                      borderRadius:
                      BorderRadius.circular(12.r),

                    ),

                    child: ClipRRect(

                      borderRadius:
                      BorderRadius.circular(10.r),

                      child: Image.network(

                        images[index],

                        width:75.w,

                        height:75.h,

                        fit: BoxFit.cover,

                      ),

                    ),

                  ),

                );

              },

            ),

          ),

        ],

      ),

    );

  }

  Widget _circleButton(
      IconData icon){

    return Container(

      width:40,

      height:40,

      decoration: BoxDecoration(

        color: Colors.white,

        shape: BoxShape.circle,

        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(.10),

            blurRadius:6,

          ),

        ],

      ),

      child: Icon(

        icon,

        color: AppColors.primaryColor,

      ),

    );

  }

}