import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class OrderHeaderWidget extends StatelessWidget {
  const OrderHeaderWidget({super.key});

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

      /// Mobile
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
              Icons.shopping_bag_outlined,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Order Management",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "Manage customer orders, payments and delivery status.",
            style: TextStyle(
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(.12),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 16,
                ),

                SizedBox(width: 6),

                Text(
                  "Orders Online",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      )

      /// Tablet & Desktop
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
              Icons.shopping_bag_outlined,
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
                  "Order Management",
                  style: TextStyle(
                    fontSize: isDesktop ? 28 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Manage customer orders, payments and delivery status.",
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
              horizontal: isDesktop ? 18 : 14,
              vertical: isDesktop ? 10 : 8,
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
                  size: isDesktop ? 18 : 16,
                ),

                SizedBox(
                  width: isDesktop ? 8 : 6,
                ),

                Text(
                  "Orders Online",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: isDesktop ? 14 : 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}