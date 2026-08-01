import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class CustomerFilterWidget extends StatefulWidget {

  final ValueChanged<String>? onSearch;
  final ValueChanged<String>? onStatusChanged;
  final ValueChanged<String>? onSortChanged;
  final VoidCallback? onExport;

  const CustomerFilterWidget({
    super.key,
    this.onSearch,
    this.onStatusChanged,
    this.onSortChanged,
    this.onExport,
  });

  @override
  State<CustomerFilterWidget> createState() =>
      _CustomerFilterWidgetState();
}

class _CustomerFilterWidgetState
    extends State<CustomerFilterWidget> {

  final TextEditingController searchController =
  TextEditingController();

  String selectedStatus = "All";
  String selectedSort = "Newest";

  final statusList = [
    "All",
    "Active",
    "Inactive",
    "Blocked",
  ];

  final sortList = [
    "Newest",
    "Oldest",
    "Most Orders",
    "A-Z",
  ];

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet =
        width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    return Container(
      padding: EdgeInsets.all(
        isMobile ? 16 : 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),

      child: isMobile
          ? Column(
        children: [

          _searchField(),

          const SizedBox(height: 15),

          _statusDropdown(),

          const SizedBox(height: 15),

          _sortDropdown(),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            child: _exportButton(),
          ),
        ],
      )
          : Row(
        children: [

          Expanded(
            flex: 3,
            child: _searchField(),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: _statusDropdown(),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: _sortDropdown(),
          ),

          const SizedBox(width: 16),

          _exportButton(),
        ],
      ),
    );
  }

  Widget _searchField() {

    final width =
        MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet =
        width >= 700 && width < 1100;

    final double fontSize = isDesktop
        ? 14
        : isTablet
        ? 13
        : 12;

    return SizedBox(
      height: isDesktop ? 48 : 52,
      child: TextField(
        controller: searchController,
        onChanged: widget.onSearch,
        style: TextStyle(
          fontSize: fontSize,
        ),
        decoration: InputDecoration(
          hintText: "Search customer...",
          hintStyle: TextStyle(
            fontSize: fontSize,
          ),
          prefixIcon: const Icon(
            Icons.search,
          ),
          filled: true,
          fillColor:
          const Color(0xffF8F9FB),
          contentPadding:
          const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  Widget _statusDropdown() {

    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;
    return SizedBox(
      width: isMobile ? double.infinity : isTablet ? 180 : 200,
      child: _dropdown(
        value: selectedStatus,
        label: "Status",
        icon: Icons.filter_alt_outlined,
        items: statusList,
        onChanged: (value) {
          setState(() {
            selectedStatus = value;
          });
          widget.onStatusChanged?.call(value);
        },
      ),
    );
  }




  Widget _sortDropdown() {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;
    return SizedBox(
      width: isMobile ? double.infinity : isTablet ? 180 : 200,
      child: _dropdown(
        value: selectedSort,
        label: "Sort By",
        icon: Icons.sort,
        items: sortList,
        onChanged: (value) {
          setState(() {
            selectedSort = value;
          });
          widget.onSortChanged?.call(value);
        },
      ),
    );
  }

  Widget _dropdown({
    required String value,
    required String label,
    required IconData icon,
    required List<String> items,
    required Function(String) onChanged,
  }) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet =
        width >= 700 && width < 1100;

    final double fontSize = isDesktop
        ? 14
        : isTablet
        ? 13
        : 12;

    return SizedBox(
      height: 52,
      child: DropdownButtonFormField<String>(
        value: value,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: fontSize,
          ),
          prefixIcon: Icon(
            icon,
            size: fontSize + 8,
          ),
          filled: true,
          fillColor: const Color(0xffF8F9FB),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(14),
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
                fontSize: fontSize,
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

  Widget _exportButton() {

    final width =
        MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet =
        width >= 700 && width < 1100;

    return SizedBox(
      height: isDesktop ? 48 : 52,
      child: OutlinedButton.icon(
        onPressed: widget.onExport,
        icon: Icon(
          Icons.download,
          size: isDesktop ? 18 : 20,
        ),
        label: Text(
          "Export",
          style: TextStyle(
            fontSize: isDesktop
                ? 13
                : isTablet
                ? 12
                : 11,
            fontWeight:
            FontWeight.w600,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: AppColors.primaryColor,
          ),
          foregroundColor:
          AppColors.primaryColor,
          padding:
          const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}