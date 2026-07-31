import 'package:flutter/material.dart';

class AdminHeaderWidget extends StatelessWidget {
  const AdminHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isDesktop = width >= 1100;

    /// Responsive Sizes
    final double searchWidth = isDesktop
        ? 480
        : isTablet
        ? 340
        : 180;

    final double headerHeight = isDesktop
        ? 68
        : isTablet
        ? 64
        : 60;

    final double buttonHeight = isDesktop
        ? 40
        : 36;

    return Container(
      height: headerHeight,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 22 : 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [

          /// Search Box
          SizedBox(
            width: searchWidth,
            height: 42,
            child: TextField(
              style: TextStyle(
                fontSize: isDesktop ? 13 : 12,
                color: const Color(0xff333333),
              ),
              decoration: InputDecoration(
                isDense: true,

                filled: true,
                fillColor: const Color(0xffF6F7FB),

                hintText: "Search or type a command",

                hintStyle: TextStyle(
                  fontSize: isDesktop ? 13 : 12,
                  color: const Color(0xff8A8A8A),
                ),

                prefixIcon: Icon(
                  Icons.search,
                  size: isDesktop ? 20 : 18,
                  color: Colors.black54,
                ),

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xff4F6EF7),
                  ),
                ),
              ),
            ),
          ),

          const Spacer(),

          /// Create Button
          SizedBox(
            height: buttonHeight,
            child: ElevatedButton.icon(
              onPressed: () {},

              icon: Icon(
                Icons.add,
                size: isDesktop ? 16 : 15,
                color: Colors.white,
              ),

              label: Text(
                isMobile ? "Add" : "Create",
                style: TextStyle(
                  fontSize: isDesktop ? 13 : 12,
                  fontWeight: FontWeight.w600,
                ),
              ),

              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xff4F6EF7),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 18 : 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),

          SizedBox(width: isDesktop ? 22 : 14),

          /// Notification
          Icon(
            Icons.notifications_none,
            size: isDesktop ? 23 : 21,
            color: Colors.black87,
          ),

          SizedBox(width: isDesktop ? 18 : 12),

          /// Edit
          Icon(
            Icons.edit_outlined,
            size: isDesktop ? 22 : 20,
            color: Colors.black87,
          ),

          SizedBox(width: isDesktop ? 18 : 12),

          /// Profile
          CircleAvatar(
            radius: isDesktop ? 18 : 16,
            backgroundImage: const NetworkImage(
              "https://i.pravatar.cc/150?img=12",
            ),
          ),
        ],
      ),
    );
  }
}