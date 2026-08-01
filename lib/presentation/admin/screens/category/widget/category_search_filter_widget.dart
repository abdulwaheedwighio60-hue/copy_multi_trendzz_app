import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class CategorySearchFilterWidget extends StatefulWidget {
  final Function(String)? onSearchChanged;
  final Function(String)? onStatusChanged;
  final Function(String)? onSortChanged;
  final VoidCallback? onAddCategory;
  final VoidCallback? onExport;

  const CategorySearchFilterWidget({
    super.key,
    this.onSearchChanged,
    this.onStatusChanged,
    this.onSortChanged,
    this.onAddCategory,
    this.onExport,
  });

  @override
  State<CategorySearchFilterWidget> createState() =>
      _CategorySearchFilterWidgetState();
}

class _CategorySearchFilterWidgetState
    extends State<CategorySearchFilterWidget> {
  String selectedStatus = "All";
  String selectedSort = "Newest";

  final List<String> statusList = [
    "All",
    "Active",
    "Inactive",
  ];

  final List<String> sortList = [
    "Newest",
    "Oldest",
    "A-Z",
    "Z-A",
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: isMobile
          ? Column(
        children: [
          _searchField(context),
          const SizedBox(height: 15),
          _statusDropdown(context),
          const SizedBox(height: 15),
          _sortDropdown(context),
          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(child: _exportButton(context)),
              const SizedBox(width: 12),
              Expanded(child: _addButton()),
            ],
          ),
        ],
      )
          : isTablet
          ? Column(
        children: [
          _searchField(context),
          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(child: _statusDropdown(context)),
              const SizedBox(width: 15),
              Expanded(child: _sortDropdown(context)),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _exportButton(context),
              const SizedBox(width: 12),
              _addButton(),
            ],
          )
        ],
      )
          : Row(
        children: [
          Expanded(
            flex: 4,
            child: _searchField(context),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: _statusDropdown(context),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: _sortDropdown(context),
          ),

          const SizedBox(width: 18),

          _exportButton(context),

          const SizedBox(width: 12),

          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: isDesktop ? 220 : 180,
              maxWidth: isDesktop ? 240 : double.infinity,
              minHeight: 52,
            ),
            child: ElevatedButton.icon(
              onPressed: (){},
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

  Widget _searchField(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;
    return SizedBox(
      height: isMobile ? 46 : 52,
      child: TextField(
        // onChanged: onSearch,
        style: TextStyle(
          fontSize:
          isMobile ? 13 : 15,
        ),
        decoration: InputDecoration(
          hintText: "Search sellers...",
          hintStyle: TextStyle(

            color: Colors.grey.shade500,
            fontSize: isMobile ? 13 : 14,
          ),
          prefixIcon: Icon(Icons.search_rounded,
            size: isMobile ? 20 : 23,
            color: Colors.grey.shade600,
          ),

          filled:true,
          fillColor: const Color(0xffF8F9FB),
          contentPadding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 18,
            vertical: isMobile ? 10 : 15,

          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width:1.5,
            ),
          ),

        ),
      ),
    );
  }

  Widget _statusDropdown(BuildContext context) {
    return _dropdown(
      context: context,
      value: selectedStatus,
      label: "Status",
      icon: Icons.filter_alt_outlined,
      items: statusList,
      onChanged: (value) {
        setState(() => selectedStatus = value);
        widget.onStatusChanged?.call(value);
      },
    );
  }

  Widget _sortDropdown(BuildContext context) {
    return _dropdown(
      context: context,
      value: selectedSort,
      label: "Sort By",
      icon: Icons.sort,
      items: sortList,
      onChanged: (value) {
        setState(() => selectedSort = value);
        widget.onSortChanged?.call(value);
      },
    );
  }

  Widget _dropdown({
    required BuildContext context,
    required String value,
    required String label,
    required IconData icon,
    required List<String> items,
    required Function(String) onChanged,
  }) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    return SizedBox(
      height: isDesktop ? 56 : 52,
      child: DropdownButtonFormField<String>(
        value: value,
        isExpanded: true,
        style: TextStyle(
          fontSize: isDesktop
              ? 15
              : isTablet
              ? 14
              : 13,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: isDesktop
                ? 15
                : isTablet
                ? 14
                : 13,
          ),
          prefixIcon: Icon(
            icon,
            size: isDesktop ? 22 : 20,
          ),
          filled: true,
          fillColor: const Color(0xffF8F9FB),
          contentPadding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 18 : 14,
            vertical: isDesktop ? 18 : 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
        items: items
            .map(
              (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: isDesktop
                    ? 15
                    : isTablet
                    ? 14
                    : 13,
              ),
            ),
          ),
        )
            .toList(),
        onChanged: (v) {
          if (v != null) {
            onChanged(v);
          }
        },
      ),
    );
  }

  Widget _exportButton(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    return SizedBox(
      width: isDesktop
          ? 180
          : isTablet
          ? 160
          : double.infinity,
      height: isDesktop ? 56 : 52,
      child: OutlinedButton.icon(
        onPressed: widget.onExport,
        icon: Icon(
          Icons.download,
          size: isDesktop ? 22 : 20,
        ),
        label: Text(
          "Export",
          style: TextStyle(
            fontSize: isDesktop
                ? 15
                : isTablet
                ? 14
                : 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          side: const BorderSide(
            color: AppColors.primaryColor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 22 : 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  Widget _addButton() {
    return SizedBox(
      height: 52,
      child: ElevatedButton.icon(
        onPressed: widget.onAddCategory,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Add Category",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}