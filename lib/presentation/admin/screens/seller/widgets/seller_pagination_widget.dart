import 'package:flutter/material.dart';


class SellerPaginationWidget extends StatelessWidget {


  final int currentPage;

  final int totalPages;

  final int totalSellers;


  final Function(int)? onPageChanged;



  const SellerPaginationWidget({

    super.key,

    required this.currentPage,

    required this.totalPages,

    required this.totalSellers,

    this.onPageChanged,

  });





  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isDesktop = width >= 1100;

    final double padding = isMobile ? 16 : isTablet ? 18 : 22;
    final double titleSize = isMobile ? 12 : isTablet ? 13 : 14;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
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

          Text(
            "Showing page $currentPage of $totalPages",
            style: TextStyle(
              fontSize: titleSize,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            "Total Sellers : $totalSellers",
            style: TextStyle(
              fontSize: titleSize,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 16),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _paginationButtons(context),
          ),
        ],
      )
          : Row(
        children: [

          Expanded(
            child: Text(
              "Showing page $currentPage of $totalPages • Total Sellers : $totalSellers",
              style: TextStyle(
                fontSize: titleSize,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          _paginationButtons(context),
        ],
      ),
    );
  }







  Widget _paginationButtons(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        _button(context,
          icon: Icons.arrow_back_ios_new,
          enabled: currentPage > 1,
          onTap: () {
            if (currentPage > 1) {
              onPageChanged?.call(currentPage - 1);
            }
          },
        ),

        SizedBox(width: isMobile ? 6 : 8),

        ...List.generate(
          totalPages > 5 ? 5 : totalPages,
              (index) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 2 : 4,
            ),
            child: _pageButton(
              context,
              index + 1,
            ),
          ),
        ),

        SizedBox(width: isMobile ? 6 : 8),

        _button(
          context,
          icon: Icons.arrow_forward_ios,
          enabled: currentPage < totalPages,
          onTap: () {
            if (currentPage < totalPages) {
              onPageChanged?.call(currentPage + 1);
            }
          },
        ),
      ],
    );
  }







  Widget _pageButton(
      BuildContext context,
      int page,
      ) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;

    final bool selected = page == currentPage;

    return InkWell(
      onTap: () => onPageChanged?.call(page),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: isMobile ? 34 : isTablet ? 38 : 42,
        height: isMobile ? 34 : isTablet ? 38 : 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? Colors.blue
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "$page",
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            fontWeight: FontWeight.w600,
            color: selected
                ? Colors.white
                : Colors.black87,
          ),
        ),
      ),
    );
  }








  Widget _button(
      BuildContext context, {
        required IconData icon,
        required bool enabled,
        required VoidCallback onTap,
      }) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;

    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: isMobile ? 34 : isTablet ? 38 : 42,
        height: isMobile ? 34 : isTablet ? 38 : 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: enabled
              ? Colors.blue.withOpacity(.12)
              : Colors.grey.withOpacity(.10),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: isMobile ? 15 : isTablet ? 17 : 18,
          color: enabled
              ? Colors.blue
              : Colors.grey,
        ),
      ),
    );
  }


}