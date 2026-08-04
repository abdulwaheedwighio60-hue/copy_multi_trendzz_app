import 'package:flutter/material.dart';

class ResponsiveDataTableWidget extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final Color? headingRowColor;
  final Color? borderColor;

  const ResponsiveDataTableWidget({
    super.key,
    required this.columns,
    required this.rows,
    this.headingRowColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor ?? Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: width,
            ),
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(
                headingRowColor ?? Colors.grey.shade50,
              ),

              headingRowHeight: isDesktop
                  ? 62
                  : isTablet
                  ? 60
                  : 56,

              dataRowMinHeight: isDesktop
                  ? 78
                  : isTablet
                  ? 72
                  : 68,

              dataRowMaxHeight: isDesktop
                  ? 82
                  : isTablet
                  ? 76
                  : 72,

              horizontalMargin: isDesktop
                  ? 22
                  : isTablet
                  ? 18
                  : 14,

              columnSpacing: isDesktop
                  ? 36
                  : isTablet
                  ? 28
                  : 20,

              dividerThickness: .6,

              columns: columns,
              rows: rows,
            ),
          ),
        ),
      ),
    );
  }
}