import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class ProductHeaderWidget extends StatelessWidget {
  const ProductHeaderWidget({super.key});

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
              Icons.inventory_2_outlined,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Product Management",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "Manage all products, inventory and seller listings.",
            style: TextStyle(
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
        ],
      )
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
              Icons.inventory_2_outlined,
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
                  "Product Management",
                  style: TextStyle(
                    fontSize: isDesktop ? 28 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Manage all products, inventory and seller listings.",
                  style: TextStyle(
                    fontSize: isDesktop ? 15 : 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop
                  ? 18
                  : isTablet
                  ? 14
                  : 12,
              vertical: isDesktop
                  ? 10
                  : 8,
            ),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(.12),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: isDesktop
                      ? 18
                      : isTablet
                      ? 16
                      : 14,
                ),

                SizedBox(
                  width: isDesktop ? 8 : 6,
                ),

                Text(
                  "Products Online",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: isDesktop
                        ? 14
                        : isTablet
                        ? 13
                        : 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}