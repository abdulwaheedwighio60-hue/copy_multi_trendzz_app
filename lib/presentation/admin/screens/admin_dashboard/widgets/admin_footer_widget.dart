import 'package:flutter/material.dart';

class AdminFooterWidget extends StatelessWidget {
  const AdminFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isDesktop = width >= 1100;

    final double textSize = isDesktop
        ? 13
        : isTablet
        ? 12
        : 11;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: isDesktop ? 30 : 20),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 24 : 16,
        vertical: isDesktop ? 18 : 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),

      /// Desktop Layout
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "© 2026 Multi Trendzz. All Rights Reserved.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: textSize,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 12),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            children: [
              _footerButton("Privacy Policy", textSize),
              _footerButton("Terms", textSize),
              _footerButton("Support", textSize),
            ],
          ),
        ],
      )

      /// Tablet & Desktop Layout
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "© 2026 Multi Trendzz. All Rights Reserved.",
            style: TextStyle(
              fontSize: textSize,
              color: Colors.grey.shade600,
            ),
          ),

          Row(
            children: [
              _footerButton("Privacy Policy", textSize),
              SizedBox(width: isDesktop ? 8 : 4),

              _footerButton("Terms", textSize),
              SizedBox(width: isDesktop ? 8 : 4),

              _footerButton("Support", textSize),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerButton(String title, double fontSize) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}