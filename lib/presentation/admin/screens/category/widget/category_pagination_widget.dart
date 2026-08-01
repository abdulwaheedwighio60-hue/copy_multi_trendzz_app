import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class CategoryPaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int>? onPageChanged;

  const CategoryPaginationWidget({
    super.key,
    this.currentPage = 1,
    this.totalPages = 10,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: isMobile
          ? Column(
        children: [
          Text(
            "Page $currentPage of $totalPages",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: _button(
                  "Previous",
                  Icons.keyboard_arrow_left,
                  currentPage > 1,
                      () => onPageChanged?.call(currentPage - 1),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _button(
                  "Next",
                  Icons.keyboard_arrow_right,
                  currentPage < totalPages,
                      () => onPageChanged?.call(currentPage + 1),
                ),
              ),
            ],
          )
        ],
      )
          : Row(
        children: [
          Text(
            "Showing Page $currentPage of $totalPages",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),

          _button(
            "Previous",
            Icons.keyboard_arrow_left,
            currentPage > 1,
                () => onPageChanged?.call(currentPage - 1),
          ),

          const SizedBox(width: 10),

          ...List.generate(
            totalPages > 5 ? 5 : totalPages,
                (index) {
              final page = index + 1;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: InkWell(
                  onTap: () => onPageChanged?.call(page),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 42,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: page == currentPage
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: page == currentPage
                            ? AppColors.primaryColor
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      "$page",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: page == currentPage
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(width: 10),

          _button(
            "Next",
            Icons.keyboard_arrow_right,
            currentPage < totalPages,
                () => onPageChanged?.call(currentPage + 1),
          ),
        ],
      ),
    );
  }

  Widget _button(
      String text,
      IconData icon,
      bool enabled,
      VoidCallback onTap,
      ) {
    return ElevatedButton.icon(
      onPressed: enabled ? onTap : null,
      icon: Icon(icon, size: 18),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: enabled
            ? AppColors.primaryColor
            : Colors.grey.shade300,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}