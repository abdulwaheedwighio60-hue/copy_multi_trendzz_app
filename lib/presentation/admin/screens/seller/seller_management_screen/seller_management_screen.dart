import 'package:flutter/material.dart';
import 'package:multi_trendzz/presentation/admin/screens/admin_dashboard/widgets/admin_dashboard_header_widget.dart';
import 'package:multi_trendzz/presentation/admin/screens/admin_dashboard/widgets/admin_footer_widget.dart';
import 'package:multi_trendzz/presentation/admin/screens/admin_dashboard/widgets/admin_side_bar_widget.dart';

import 'package:multi_trendzz/presentation/admin/screens/seller/dialog/add_seller_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/widgets/seller_header_widget.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/widgets/seller_pagination_widget.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/widgets/seller_search_filter_widget.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/widgets/seller_statistics_widget.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/widgets/seller_table_widget.dart';



class SellerManagementScreen extends StatefulWidget {

  const SellerManagementScreen({
    super.key,
  });

  @override
  State<SellerManagementScreen> createState() => _SellerManagementScreenState();
}
class _SellerManagementScreenState extends State<SellerManagementScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    final isDesktop = width >= 1100;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffF7F8FA),
      drawer: isMobile
          ? const Drawer(child: AdminSidebarWidget(),
      )
          : null,
      body: SafeArea(
        child: Row(
          children: [
            /// Desktop Sidebar
            if(isDesktop)
              const AdminSidebarWidget(),
            /// Main Area

            Expanded(
              child: Column(
                children: [
                  /// Top Header
                  AdminDashboardHeaderWidget(
                    onMenuTap:(){
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  /// Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SellerHeaderWidget(),
                          const SizedBox(height:25),
                          const SellerStatisticsWidget(),
                          const SizedBox(height:25),
                          SellerSearchFilterWidget(
                            onSearchChanged:(value){
                              debugPrint("Search : $value");
                            },
                            onStatusChanged:(value){
                              debugPrint("Status : $value");

                            },
                            onStoreChanged:(value){
                              debugPrint(
                                  "Store : $value"
                              );
                            },
                            onAddSeller:(){
                              showDialog(
                                context:context,
                                builder:(context){
                                  return AddSellerDialog(
                                    onSave:(){
                                      debugPrint("Seller Added");
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height:25),
                          const SellerTableWidget(),
                          const SizedBox(height:20),
                          SellerPaginationWidget(
                            currentPage:1,
                            totalPages:10,
                            totalSellers:250,
                            onPageChanged:(page){
                              debugPrint("Page : $page",);
                            },
                          ),
                        ],
                      ),

                    ),
                  ),
                  /// Footer
                  const AdminFooterWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}