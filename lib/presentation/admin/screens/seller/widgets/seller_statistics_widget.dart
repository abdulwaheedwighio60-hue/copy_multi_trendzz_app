import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class SellerStatisticsWidget extends StatelessWidget {
  const SellerStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;


    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    if (isDesktop) {
      return Row(
        children: [
          Expanded(
            child: _card(
              title: "Total Sellers",
              value: "1,250",
              icon: Icons.people_alt_outlined,
              color: Colors.blue,
              growth: "+12%",
                context: context
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: _card(
              title: "Active Sellers",
              value: "1,120",
              icon: Icons.verified_user_outlined,
              color: Colors.green,
              growth: "+8%",
                context: context
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: _card(
              title: "Pending",
              value: "75",
              icon: Icons.hourglass_empty,
              color: Colors.orange,
              growth: "+5%",
                context: context
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: _card(
              title: "Blocked",
              value: "55",
              icon: Icons.block,
              color: Colors.red,
              growth: "-2%",
                context: context
            ),
          ),
        ],
      );
    }

    return GridView.count(
      crossAxisCount:
      isDesktop ? 4 : isTablet ? 2 : 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: isMobile ? 12 : 18,
      mainAxisSpacing: isMobile ? 12 : 18,
      childAspectRatio: isDesktop ? 1.9 : isTablet ? 2.5 : 3.0,
      children: [
        _card(
          title: "Total Sellers",
          value: "1,250",
          icon: Icons.people_alt_outlined,
          color: Colors.blue,
          growth: "+12%",
            context: context
        ),

        _card(
          title: "Active Sellers",
          value: "1,120",
          icon: Icons.verified_user_outlined,
          color: Colors.green,
          growth: "+8%",
            context: context
        ),

        _card(
          title: "Pending",
          value: "75",
          icon: Icons.hourglass_empty,
          color: Colors.orange,
          growth: "+5%",
            context: context
        ),
        _card(
          title: "Blocked",
          value: "55",
          icon: Icons.block,
          color: Colors.red,
          growth: "-2%",
          context: context
        ),
      ],
    );
  }
  }

  Widget _card({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required String growth,
    required BuildContext context,
  }) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;
    final bool isDesktop = width >= 1100;
    return Container(padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200,),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0,5),
          )
        ],
      ),

      child: Row(
        children: [
          Container(
            width: isMobile ? 48 : 58,
            height: isMobile ? 48 : 58,
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon, size: isMobile ? 24 : 30,
              color: color,
            ),
          ),

          SizedBox(
            width: isMobile ? 12 : 18,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines:1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height:6),
                Text(
                  value,
                  style:
                  TextStyle(
                    fontSize: isDesktop ? 28 : isMobile ? 22 : 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height:8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal:8,
                    vertical:4,
                  ),
                  decoration: BoxDecoration(
                    color: growth.startsWith("-")
                        ? Colors.red.withOpacity(.1)
                        : Colors.green.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        growth.startsWith("-") ? Icons.trending_down : Icons.trending_up,
                        size:15,
                        color: growth.startsWith("-")
                            ? Colors.red
                            : Colors.green,
                      ),
                      const SizedBox(width:4),
                      Text(
                        growth,
                        style: TextStyle(
                          fontSize:12,
                          fontWeight: FontWeight.w600,
                          color: growth.startsWith("-")
                              ? Colors.red : Colors.green
                        ),
                      ),
                      const SizedBox(width:5),
                      Text(
                        "month",
                        style: TextStyle(
                          fontSize:11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }