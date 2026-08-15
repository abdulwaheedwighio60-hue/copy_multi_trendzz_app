import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/model/product.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/widgets/produc_card_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/add_product/add_product_screen.dart';

class ManageProductsScreen extends StatefulWidget {
  const ManageProductsScreen({super.key});

  @override
  State<ManageProductsScreen> createState() => _ManageProductsScreenState();
}

class _ManageProductsScreenState extends State<ManageProductsScreen> {
  // ============================================================
  // CONTROLLERS
  // ============================================================
  final TextEditingController searchController = TextEditingController();
  // ============================================================
  // FILTER VALUES
  // ============================================================
  String selectedTab = 'Active';
  String selectedCategory = 'Please Select';
  String selectedSort = 'Please Select';
  bool outOfStock = false;
  // ============================================================
  // PRODUCTS
  // ============================================================
  final List<Product> products = [
    Product(
      name: 'Test product 6738289944',
      sku: '496059780-1721723147696-0',
      price: 100,
      stock: 10,
      image: null,
      active: true,
      score: 'To be Improved',
    ),

    Product(
      name: 'Basic Information test',
      sku: '496116147-1721709814701-0',
      price: 100,
      stock: 1,
      image: null,
      active: true,
      score: 'To be Improved',
    ),

    Product(
      name: 'Sony Digital Camera',
      sku: 'CAM-001',
      price: 45000,
      stock: 5,
      image: null,
      active: true,
      score: 'Good',
    ),

    Product(
      name: 'Wireless Headphones',
      sku: 'HEAD-001',
      price: 5500,
      stock: 0,
      image: null,
      active: false,
      score: 'To be Improved',
    ),
  ];

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  // ============================================================
  // FILTERED PRODUCTS
  // ============================================================
  List<Product> get filteredProducts {
    List<Product> result =
    List<Product>.from(products);
    // ----------------------------------------------------------
    // STATUS FILTER
    // ----------------------------------------------------------
    if (selectedTab == 'Active') {
      result =
          result.where((product) => product.active).toList();
    }

    if (selectedTab == 'Inactive') {
      result =
          result.where((product) => !product.active).toList();
    }
    // ----------------------------------------------------------
    // OUT OF STOCK
    // ----------------------------------------------------------
    if (outOfStock) {
      result =
          result.where((product) => product.stock == 0).toList();
    }
    // ----------------------------------------------------------
    // SEARCH
    // ----------------------------------------------------------
    final String search = searchController.text.trim().toLowerCase();
    if (search.isNotEmpty) {
      result = result.where((product) {
        final String productName =
        product.name.toLowerCase();
        final String productSku = product.sku.toLowerCase();
        return productName.contains(search) ||
            productSku.contains(search);
      }).toList();
    }
    // ----------------------------------------------------------
    // CATEGORY
    //
    // Currently Product model does not contain category.
    // When category is added to Product model, filtering can
    // be implemented here.
    // ----------------------------------------------------------

    // ----------------------------------------------------------
    // SORT
    // ----------------------------------------------------------
    if (selectedSort == 'Price: Low to High') {
      result.sort(
            (a, b) => a.price.compareTo(b.price),
      );
    }
    if (selectedSort == 'Price: High to Low') {
      result.sort(
            (a, b) => b.price.compareTo(a.price),
      );
    }
    if (selectedSort == 'Stock') {
      result.sort(
            (a, b) => b.stock.compareTo(a.stock),
      );
    }
    return result;
  }
  // ============================================================
  // BUILD
  // ============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      // ========================================================
      // APP BAR
      // ========================================================
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Manage Products',
          style: AppTextStyles.titleMedium.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Notification screen
            },
            icon: const Icon(
              Icons.notifications_none_rounded,
            ),
          ),
        ],
      ),
      // ========================================================
      // BODY
      // ========================================================
      body: RefreshIndicator(
        onRefresh: _refreshProducts,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          padding: EdgeInsets.fromLTRB(
            16.w,
            14.h,
            16.w,
            100.h,
          ),
          children: [
            // ==================================================
            // HEADER
            // ==================================================
            _buildHeader(),
            SizedBox(height: 14.h),
            // ==================================================
            // INFO BANNER
            // ==================================================
            _buildInfoBanner(),
            SizedBox(height: 16.h),
            // ==================================================
            // STATUS TABS
            // ==================================================
            _buildStatusTabs(),
            SizedBox(height: 14.h),
            // ==================================================
            // FILTER
            // ==================================================
            _buildFilterSection(),
            SizedBox(height: 16.h),
            // ==================================================
            // PRODUCT HEADER
            // ==================================================
            _buildProductHeader(),
            SizedBox(height: 10.h),
            // ==================================================
            // PRODUCTS
            // ==================================================
            if (filteredProducts.isEmpty)
              _buildEmptyState()
            else
              ...filteredProducts.map(
                    (product) => Padding(
                  padding: EdgeInsets.only(
                    bottom: 12.h,
                  ),
                  child: ProductCardWidget(
                    name: product.name,
                    sku: product.sku,
                    price: product.price,
                    stock: product.stock,
                    isActive: product.active,
                    score: product.score,
                    // ------------------------------------------
                    // EDIT
                    // ------------------------------------------
                    onEdit: () {
                      _editProduct(product);
                    },
                    // ------------------------------------------
                    // ACTIVE / INACTIVE
                    // ------------------------------------------
                    onStatusChanged: (value) {
                      setState(() {
                        product.active = value;
                      });
                    },
                    // ------------------------------------------
                    // MORE
                    // ------------------------------------------
                    onMore: () {
                      _showProductOptions(product);
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
      // ========================================================
      // ADD PRODUCT BUTTON
      // ========================================================
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 3,
        onPressed: _addProduct,
        icon: const Icon(Icons.add,),
        label: const Text('Add Product',),
      ),
    );
  }
  // ============================================================
  // HEADER
  // ============================================================
  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Manage Products',
                style: AppTextStyles.titleLarge.copyWith(
                  fontWeight:
                  FontWeight.w800,
                ),
              ),
              SizedBox(height: 3.h),
              Text('${products.length} products',
                style: AppTextStyles.bodySmall.copyWith(
                  color:
                  Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        OutlinedButton.icon(
          onPressed: _addProduct,
          icon: const Icon(Icons.add, size: 18,),
          label: const Text('Add New',),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
            side: BorderSide(color: AppColors.primaryColor,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r,),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 11.w,
              vertical: 10.h,
            ),
          ),
        ),
      ],
    );
  }
  // ============================================================
  // INFO BANNER
  // ============================================================
  Widget _buildInfoBanner() {
    return Container(
      padding: EdgeInsets.all(13.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.07),
        borderRadius: BorderRadius.circular(13.r),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(.15),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor.withOpacity(.12),
            ),
            child: Icon(
              Icons.info_outline_rounded,
              color: AppColors.primaryColor,
              size: 19.sp,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product Management',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight:
                    FontWeight.w700,
                  ),
                ),
                SizedBox(height: 3.h),
                Text('Manage your products, stock, pricing and visibility from here.',
                  style: AppTextStyles.bodySmall.copyWith(
                    color:
                    Colors.grey.shade700,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: () {
                    // TODO: Learn more
                  },
                  child: Text('Learn More',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: Icon(
              Icons.close,
              size: 18.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STATUS TABS
  // ============================================================

  Widget _buildStatusTabs() {
    final List<StatusTab> tabs = [
      StatusTab('All',
        products.length,
      ),

      StatusTab(
        'Active',
        products.where((e) => e.active).length,
      ),

      StatusTab(
        'Inactive',
        products.where((e) => !e.active).length,
      ),

      const StatusTab(
        'Draft',
        71,
      ),

      const StatusTab(
        'Pending QC',
        2,
      ),

      const StatusTab(
        'Violation',
        1628,
      ),

      const StatusTab(
        'Deleted',
        8,
      ),
    ];

    return SizedBox(
      height: 42.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => SizedBox(
          width: 8.w,
        ),
        itemBuilder: (_, index) {
          final StatusTab tab = tabs[index];
          final bool selected = selectedTab == tab.title;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTab =
                    tab.title;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200,),
              padding: EdgeInsets.symmetric(
                horizontal: 13.w,
                vertical: 7.h,
              ),
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(10.r,),
                border: Border.all(
                  color: selected
                      ? AppColors.primaryColor
                      : Colors.grey.shade300,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    tab.title,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: selected
                          ? Colors.white
                          : Colors.grey.shade700,
                      fontWeight: selected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? Colors.white
                          : Colors.orange
                          .withOpacity(.12),
                      borderRadius: BorderRadius.circular(
                        6.r,
                      ),
                    ),
                    child: Text(
                      '${tab.count}',
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w800,
                        color: selected? AppColors.primaryColor : Colors.orange.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  // ============================================================
  // FILTER SECTION
  // ============================================================

  Widget _buildFilterSection() {

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15.r,
        ),
        border: Border.all(
          color:
          Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.filter_list_rounded,
                size: 19.sp,
                color:
                AppColors.primaryColor,
              ),
              SizedBox(width: 7.w),
              Text(
                'Filter Products',
                style:
                AppTextStyles.bodyMedium.copyWith(
                  fontWeight:
                  FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // ----------------------------------------------------
          // SEARCH
          // ----------------------------------------------------
          TextField(
            controller: searchController,
            onChanged: (_) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Search product name or SKU',
              prefixIcon: const Icon(Icons.search,),
              suffixIcon: searchController.text.isNotEmpty ? IconButton(
                onPressed: () {
                  searchController.clear();
                  setState(() {});
                },
                icon: const Icon(Icons.close,),
              ) : null,
              filled: true,
              fillColor: const Color(0xffF7F8FA,),

              contentPadding: EdgeInsets.symmetric(vertical: 13.h,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.r,),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          // ----------------------------------------------------
          // DROPDOWNS
          // ----------------------------------------------------

          Row(
            children: [
              Expanded(
                child: _filterDropdown(
                  title: 'Category',
                  value: selectedCategory,
                  items: const [
                    'Please Select',
                    'Cameras',
                    'Mobiles',
                    'Fashion',
                    'Electronics',
                    'Home Appliances',
                  ],
                  onChanged:
                      (value) {
                    setState(() {
                      selectedCategory =
                      value!;
                    });
                  },
                ),
              ),
              SizedBox(width: 9.w),
              Expanded(
                child: _filterDropdown(
                  title: 'Sort By',
                  value: selectedSort,
                  items: const [
                    'Please Select',
                    'Price: Low to High',
                    'Price: High to Low',
                    'Stock',
                    'Newest',
                  ],
                  onChanged:
                      (value) {
                    setState(() {
                      selectedSort =
                      value!;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 7.h),
          // ----------------------------------------------------
          // OUT OF STOCK
          // ----------------------------------------------------
          Row(
            children: [
              Checkbox.adaptive(
                value: outOfStock,
                activeColor: AppColors.primaryColor,
                onChanged:
                    (value) {
                  setState(() {
                    outOfStock =
                        value ?? false;
                  });
                },
              ),
              Text(
                'Out Of Stock',
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight:
                  FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FILTER DROPDOWN
  // ============================================================

  Widget _filterDropdown({
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?>onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      isExpanded: true,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
      ),
      decoration: InputDecoration(
        labelText: title,
        filled: true,
        fillColor:
        const Color(0xffF7F8FA,),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 3.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r,),
          borderSide: BorderSide(
            color:
            Colors.grey.shade300,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r,),
          borderSide: BorderSide(color:Colors.grey.shade300,),
        ),
      ),
      items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item, overflow:
              TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  // ============================================================
  // PRODUCT HEADER
  // ============================================================

  Widget _buildProductHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${filteredProducts.length} Products',
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight:
              FontWeight.w700,
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            // TODO: Export products
          },
          icon:
          const Icon(
            Icons.file_download_outlined,
            size: 17,
          ),
          label:
          const Text(
            'Export',
          ),
          style:
          TextButton.styleFrom(
            foregroundColor:
            AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
  // ============================================================
  // EMPTY STATE
  // ============================================================

  Widget _buildEmptyState() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 45.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r,),
      ),
      child: Column(
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 55.sp,
            color:Colors.grey.shade400,
          ),
          SizedBox(height: 12.h),
          Text(
            'No Products Found',
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight:
              FontWeight.w700,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'Try changing your filters.',
            style: AppTextStyles.bodySmall.copyWith(
              color:
              Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
  // ============================================================
  // REFRESH
  // ============================================================

  Future<void> _refreshProducts() async {
    await Future.delayed(
      const Duration(
        milliseconds: 700,
      ),
    );
    // TODO:
    // API se products reload karna hai.
  }

  // ============================================================
  // ADD PRODUCT
  // ============================================================
  void _addProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
        const AddProductScreen(),
      ),
    ).then((result) {
      if (!mounted) return;
      if (result == true) {
        setState(() {});
      }
    });
  }
  // ============================================================
  // EDIT PRODUCT
  // ============================================================

  Future<void> _editProduct(
      Product product,
      ) async {

    final result =
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProductScreen(product: product,),
      ),
    );

    // ----------------------------------------------------------
    // Product update hone ke baad screen refresh
    // ----------------------------------------------------------
    if (!mounted) return;
    if (result == true) {
      setState(() {});
    }
  }
  // ============================================================
  // MORE OPTIONS
  // ============================================================
  void _showProductOptions(Product product,) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r,),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.w, height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                    BorderRadius.circular(10.r,),
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight:
                    FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15.h),
                ListTile(
                  leading: const Icon(
                    Icons.edit_outlined,
                  ),
                  title: const Text(
                    'Edit Product',
                  ),
                  onTap: () {
                    Navigator.pop(context,);
                    _editProduct(product,);
                  },
                ),
                ListTile(

                  leading: const Icon(Icons.copy_outlined,),
                  title: const Text('Duplicate Product',),
                  onTap: () {
                    Navigator.pop(context,);
                    // TODO:
                    // Duplicate product
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.delete_outline,
                    color:
                    Colors.red.shade600,
                  ),
                  title:
                  Text(
                    'Delete Product',
                    style: TextStyle(
                      color:
                      Colors.red.shade600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(
                      context,
                    );
                    _deleteProduct(
                      product,
                    );
                  },
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // DELETE PRODUCT
  // ============================================================
  void _deleteProduct(Product product,) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.r,),),
          title: const Text('Delete Product',),

          content: Text('Are you sure you want to delete "${product.name}"?',),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context,);
              },
              child: const Text('Cancel',),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                Colors.red,
                foregroundColor:
                Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context,);
                setState(() {products.remove(product,);});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Product deleted successfully',
                    ),
                  ),
                );
              },
              child: const Text('Delete',),
            ),
          ],
        );
      },
    );
  }
}

// ================================================================
// STATUS TAB MODEL
// ================================================================

class StatusTab {
  final String title;
  final int count;
  const StatusTab(this.title, this.count,);
}