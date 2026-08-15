import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class ProductCategoryWidget extends StatelessWidget {
  final String? selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const ProductCategoryWidget({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  static const List<String> categories = [
    'Kids & Baby Fashion',
    'Mobiles & Tablets',
    'Computers & Laptops',
    'TV, Audio / Video, Gaming',
    'Cameras',
    'Home Appliances',
    'Health & Beauty',
    'Fashion',
    'Bags and Travel',
    'Sports & Outdoors',
  ];

  @override
  Widget build(BuildContext context) {
    return _card(
      child: GestureDetector(
        onTap: () => _showCategorySheet(context),
        child: Container(
          padding: EdgeInsets.all(13.w),
          decoration: BoxDecoration(
            color: const Color(0xffF8F9FB),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: selectedCategory == null
                  ? Colors.grey.shade300
                  : AppColors.primaryColor,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor
                      .withOpacity(.10),
                  borderRadius:
                  BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.category_outlined,
                  color: AppColors.primaryColor,
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category *',
                      style:
                      AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      selectedCategory ??
                          'Select product category',
                      style:
                      AppTextStyles.bodyMedium.copyWith(
                        fontWeight:
                        selectedCategory != null
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color:
                        selectedCategory != null
                            ? Colors.black87
                            : Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38.w,
                height: 38.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor
                      .withOpacity(.10),
                  borderRadius:
                  BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.category_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style:
                    AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Select the correct category.',
                    style:
                    AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          child,
        ],
      ),
    );
  }

  void _showCategorySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return _CategorySheet(
          selectedCategory: selectedCategory,
          onSelected: onCategorySelected,
        );
      },
    );
  }
}

class _CategorySheet extends StatefulWidget {
  final String? selectedCategory;
  final ValueChanged<String> onSelected;

  const _CategorySheet({
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  State<_CategorySheet> createState() =>
      _CategorySheetState();
}

class _CategorySheetState
    extends State<_CategorySheet> {
  final searchController = TextEditingController();

  List<String> filteredCategories =
      ProductCategoryWidget.categories;

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      final query =
      searchController.text.toLowerCase();

      setState(() {
        filteredCategories =
            ProductCategoryWidget.categories
                .where(
                  (category) => category
                  .toLowerCase()
                  .contains(query),
            )
                .toList();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
      MediaQuery.of(context).size.height * .75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.h),

          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius:
              BorderRadius.circular(10),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(18.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Select Category',
                    style: AppTextStyles.titleMedium
                        .copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 18.w),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search category',
                prefixIcon:
                const Icon(Icons.search),
                filled: true,
                fillColor:
                const Color(0xffF5F6FA),
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          SizedBox(height: 10.h),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
              ),
              itemCount:
              filteredCategories.length,
              separatorBuilder: (_, __) =>
                  Divider(
                    color: Colors.grey.shade200,
                  ),
              itemBuilder: (_, index) {
                final category =
                filteredCategories[index];

                final selected =
                    category ==
                        widget.selectedCategory;

                return ListTile(
                  contentPadding:
                  EdgeInsets.zero,
                  leading: Icon(
                    Icons.category_outlined,
                    color: selected
                        ? AppColors.primaryColor
                        : Colors.grey,
                  ),
                  title: Text(
                    category,
                    style:
                    AppTextStyles.bodyMedium.copyWith(
                      fontWeight: selected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                  trailing: selected
                      ? Icon(
                    Icons.check_circle,
                    color:
                    AppColors.primaryColor,
                  )
                      : const Icon(
                    Icons.chevron_right,
                  ),
                  onTap: () {
                    widget.onSelected(category);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}