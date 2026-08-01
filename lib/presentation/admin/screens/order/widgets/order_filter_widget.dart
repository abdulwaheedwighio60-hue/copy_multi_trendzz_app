import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class OrderFilterWidget extends StatefulWidget {
  const OrderFilterWidget({super.key});

  @override
  State<OrderFilterWidget> createState() =>
      _OrderFilterWidgetState();
}

class _OrderFilterWidgetState
    extends State<OrderFilterWidget> {

  final TextEditingController searchController =
  TextEditingController();

  final List<String> statusList = [
    "All",
    "Pending",
    "Processing",
    "Shipped",
    "Delivered",
    "Cancelled",
  ];

  final List<String> paymentList = [
    "All",
    "Paid",
    "Unpaid",
    "COD",
  ];

  String selectedStatus = "All";
  String selectedPayment = "All";

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet =
        width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    if (isMobile) {
      return Column(
        children: [

          _searchField(),

          const SizedBox(height: 15),

          _statusDropdown(),

          const SizedBox(height: 15),

          _paymentDropdown(),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            child: _exportButton(),
          ),
        ],
      );
    }

    return Row(
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
          child: _paymentDropdown(),
        ),

        const SizedBox(width: 16),

        SizedBox(
          width: isDesktop ? 150 : 130,
          child: _exportButton(),
        ),
      ],
    );
  }

  Widget _searchField() {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet =
        width >= 700 && width < 1100;

    final double fontSize = isDesktop
        ? 15
        : isTablet
        ? 14
        : 13;

    return SizedBox(
      height: 52,
      child: TextField(
        controller: searchController,
        style: TextStyle(
          fontSize: fontSize,
        ),
        decoration: InputDecoration(
          hintText: "Search Order...",
          hintStyle: TextStyle(
            fontSize: fontSize,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: fontSize + 8,
          ),
          filled: true,
          fillColor: const Color(0xffF8F9FB),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  Widget _statusDropdown() {

    return _dropdown(
      value: selectedStatus,
      label: "Status",
      icon: Icons.filter_alt_outlined,
      items: statusList,
      onChanged: (value) {
        setState(() {
          selectedStatus = value;
        });
      },
    );
  }

  Widget _paymentDropdown() {

    return _dropdown(
      value: selectedPayment,
      label: "Payment",
      icon: Icons.payments_outlined,
      items: paymentList,
      onChanged: (value) {
        setState(() {
          selectedPayment = value;
        });
      },
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

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet =
        width >= 700 && width < 1100;

    final double fontSize = isDesktop
        ? 15
        : isTablet
        ? 14
        : 13;

    final double iconSize = isDesktop
        ? 20
        : isTablet
        ? 18
        : 16;

    return SizedBox(
      height: 52,
      child: OutlinedButton.icon(
        onPressed: () {},

        icon: Icon(
          Icons.download,
          size: iconSize,
        ),

        label: Text(
          "Export",
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),

        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: AppColors.primaryColor,
          ),
          foregroundColor:
          AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}