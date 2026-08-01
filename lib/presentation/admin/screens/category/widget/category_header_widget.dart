import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class CategoryHeaderWidget extends StatelessWidget {
  final VoidCallback? onAddCategory;

  const CategoryHeaderWidget({
    super.key,
    this.onAddCategory,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile
            ? 18
            : isTablet
            ? 22
            : 28,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      //================ MOBILE ===================
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.category_outlined,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Category Management",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "Manage product categories, organize inventory and control category status.",
            style: TextStyle(
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.10),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "120 Categories",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: onAddCategory,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: const Text(
                "Add Category",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      )

      //================ TABLET & DESKTOP ===================
          : Row(
        children: [

          Container(
            width: isDesktop ? 70 : 60,
            height: isDesktop ? 70 : 60,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.12),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              Icons.category_outlined,
              color: AppColors.primaryColor,
              size: isDesktop ? 36 : 30,
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Category Management",
                  style: TextStyle(
                    fontSize: isDesktop ? 28 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Manage product categories, organize inventory and control category status.",
                  style: TextStyle(
                    fontSize: isDesktop ? 15 : 14,
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 14),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(.10),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "120 Categories",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: isDesktop ? 14 : 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 20),

          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: isDesktop ? 220 : 180,
              maxWidth: isDesktop ? 240 : double.infinity,
              minHeight: 52,
            ),
            child: ElevatedButton.icon(
              onPressed: onAddCategory,
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: isDesktop ? 22 : 20,
              ),
              label: Text(
                "Add Category",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isDesktop ? 15 : 14,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}