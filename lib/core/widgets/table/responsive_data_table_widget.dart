import 'package:flutter/material.dart';

class ResponsiveDataTableWidget extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;

  final double headingRowHeight;
  final double dataRowMinHeight;
  final double dataRowMaxHeight;
  final double horizontalMargin;
  final double columnSpacing;

  final Color? headingRowColor;
  final BorderRadius? borderRadius;

  const ResponsiveDataTableWidget({
    super.key,
    required this.columns,
    required this.rows,
    this.headingRowHeight = 60,
    this.dataRowMinHeight = 72,
    this.dataRowMaxHeight = 74,
    this.horizontalMargin = 20,
    this.columnSpacing = 30,
    this.headingRowColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    return ClipRRect(

      borderRadius:
      borderRadius ??
          BorderRadius.circular(18),

      child: Theme(

        data: Theme.of(context).copyWith(

          dividerColor: Colors.grey.shade200,

          dataTableTheme: DataTableThemeData(

            headingRowColor: MaterialStateProperty.all(
              headingRowColor ?? Colors.grey.shade100,
            ),

          ),

        ),

        child: SingleChildScrollView(

          scrollDirection: Axis.horizontal,

          child: ConstrainedBox(

            constraints: BoxConstraints(
              minWidth: isDesktop
                  ? 1100
                  : isTablet
                  ? 900
                  : 750,
            ),

            child: DataTable(

              headingRowHeight: headingRowHeight,

              dataRowMinHeight: dataRowMinHeight,

              dataRowMaxHeight: dataRowMaxHeight,

              horizontalMargin: horizontalMargin,

              columnSpacing: columnSpacing,

              headingTextStyle: TextStyle(
                fontSize: isDesktop
                    ? 15
                    : isTablet
                    ? 14
                    : 13,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),

              dataTextStyle: TextStyle(
                fontSize: isDesktop
                    ? 14
                    : isTablet
                    ? 13
                    : 12,
                color: Colors.black87,
              ),

              columns: columns,

              rows: rows,

            ),

          ),

        ),

      ),

    );

  }

}