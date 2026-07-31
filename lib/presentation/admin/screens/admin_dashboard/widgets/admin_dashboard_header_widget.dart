import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class AdminDashboardHeaderWidget extends StatelessWidget {
  final VoidCallback? onMenuTap;
  const AdminDashboardHeaderWidget({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    return Container(
      height: isDesktop ? 72 : 65,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 25 : 16,
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

          /// Mobile Menu
          if (isMobile)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: onMenuTap,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffF7F7F8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

          /// Search
          Expanded(
            child: _buildSearchBox(
              isDesktop,
              isTablet,
            ),
          ),

          const SizedBox(width: 12),

          if (!isMobile) _buildCreateButton(false),

          SizedBox(width: isDesktop ? 18 : 10),

          _buildIconButton(
            Icons.notifications_none,
                () {},
          ),

          SizedBox(width: isDesktop ? 12 : 8),

          _buildIconButton(
            Icons.edit_outlined,
                () {},
          ),

          SizedBox(width: isDesktop ? 18 : 10),

          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: isDesktop ? 18 : 16,
            backgroundImage: const NetworkImage(
              "https://i.pravatar.cc/150?img=12",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox(
      bool isDesktop,
      bool isTablet,
      ) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: TextStyle(
          fontSize: isDesktop ? 13 : 12,
        ),
        decoration: const InputDecoration(
          hintText: "Search or type a command",
          hintStyle: TextStyle(
            color: Color(0xff8B8B8B),
            fontSize: 13,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: Colors.black54,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 12),
        ),
      ),
    );
  }

  Widget _buildCreateButton(bool isMobile) {
    return SizedBox(
      height: 40,
      child: ElevatedButton.icon(
        onPressed: () {},

        icon: const Icon(
          Icons.add,
          color: Colors.white,
          size: 16,
        ),

        label: Text(
          isMobile ? "Add" : "Create",
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),

        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:AppColors.primaryColor,

          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap,) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 24,
          color: Colors.black87,
        ),
      ),
    );
  }
}