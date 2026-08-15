import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/widgets/product_action_button_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/widgets/product_basic_info_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/widgets/product_category_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/widgets/product_description_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/widgets/product_image_picker_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/widgets/product_inventory_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/widgets/product_pricing_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/widgets/product_specification_widget.dart';



class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  // Basic Information
  final productNameController = TextEditingController();
  final skuController = TextEditingController();

  // Pricing
  final sellingPriceController = TextEditingController();
  final discountPriceController = TextEditingController();
  final costPriceController = TextEditingController();
  final taxController = TextEditingController();

  // Inventory
  final stockController = TextEditingController();
  final weightController = TextEditingController();
  final lengthController = TextEditingController();
  final widthController = TextEditingController();
  final heightController = TextEditingController();

  // Description
  final descriptionController = TextEditingController();
  final tagsController = TextEditingController();

  String? selectedBrand;
  String? selectedCategory;
  String? selectedResolution;

  bool isFeatured = false;
  bool isActive = true;
  bool isLoading = false;

  @override
  void dispose() {
    productNameController.dispose();
    skuController.dispose();

    sellingPriceController.dispose();
    discountPriceController.dispose();
    costPriceController.dispose();
    taxController.dispose();

    stockController.dispose();
    weightController.dispose();
    lengthController.dispose();
    widthController.dispose();
    heightController.dispose();

    descriptionController.dispose();
    tagsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffF5F6FA),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            'Add Product',
            style: AppTextStyles.titleMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              16.w,
              14.h,
              16.w,
              110.h,
            ),
            child: Column(
              children: [

                _buildProgress(),

                SizedBox(height: 14.h),

                ProductBasicInfoWidget(
                  productNameController: productNameController,
                  skuController: skuController,
                  selectedBrand: selectedBrand,
                  onBrandChanged: (value) {
                    setState(() {
                      selectedBrand = value;
                    });
                  },
                ),

                SizedBox(height: 16.h),

                ProductCategoryWidget(
                  selectedCategory: selectedCategory,
                  onCategorySelected: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),

                SizedBox(height: 16.h),

                const ProductImagePickerWidget(),

                SizedBox(height: 16.h),

                ProductSpecificationWidget(
                  selectedBrand: selectedBrand,
                  selectedResolution: selectedResolution,
                  onBrandChanged: (value) {
                    setState(() {
                      selectedBrand = value;
                    });
                  },
                  onResolutionChanged: (value) {
                    setState(() {
                      selectedResolution = value;
                    });
                  },
                ),

                SizedBox(height: 16.h),

                ProductPricingWidget(
                  sellingPriceController:
                  sellingPriceController,
                  discountPriceController:
                  discountPriceController,
                  costPriceController:
                  costPriceController,
                  taxController: taxController,
                ),

                SizedBox(height: 16.h),

                ProductInventoryWidget(
                  stockController: stockController,
                  weightController: weightController,
                  lengthController: lengthController,
                  widthController: widthController,
                  heightController: heightController,
                  isFeatured: isFeatured,
                  isActive: isActive,
                  onFeaturedChanged: (value) {
                    setState(() {
                      isFeatured = value;
                    });
                  },
                  onStatusChanged: (value) {
                    setState(() {
                      isActive = value;
                    });
                  },
                ),

                SizedBox(height: 16.h),

                ProductDescriptionWidget(
                  descriptionController:
                  descriptionController,
                  tagsController: tagsController,
                ),

                SizedBox(height: 16.h),

                _buildWarning(),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),

        bottomNavigationBar: ProductActionButtonWidget(
          isLoading: isLoading,
          onCancel: () {
            Navigator.pop(context);
          },
          onSave: _submitProduct,
          onSaveDraft: _saveDraft,
        ),
      ),
    );
  }

  Widget _buildProgress() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 14.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          _step(
            number: '1',
            title: 'Basic',
            active: true,
          ),
          _line(),
          _step(
            number: '2',
            title: 'Details',
            active: true,
          ),
          _line(),
          _step(
            number: '3',
            title: 'Price',
            active: true,
          ),
          _line(),
          _step(
            number: '4',
            title: 'Submit',
            active: true,
          ),
        ],
      ),
    );
  }

  Widget _step({
    required String number,
    required String title,
    required bool active,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active
                  ? AppColors.primaryColor
                  : Colors.grey.shade200,
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: active
                      ? Colors.white
                      : Colors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 10.sp,
              color: active
                  ? AppColors.primaryColor
                  : Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _line() {
    return Container(
      width: 16.w,
      height: 1,
      color: Colors.grey.shade300,
      margin: EdgeInsets.only(bottom: 18.h),
    );
  }

  Widget _buildWarning() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(.07),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.orange.withOpacity(.25),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange,
            size: 20.sp,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              'Please make sure all product information is correct before submitting.',
              style: AppTextStyles.bodySmall.copyWith(
                color: Colors.orange.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveDraft() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product saved as draft'),
      ),
    );
  }

  void _submitProduct() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a category'),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    // TODO: API call
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:multi_trendzz/core/constants/app_colors.dart';
// import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_action_button_widget.dart';
// import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_basic_info_widget.dart';
// import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_description_widget.dart';
// import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_image_picker_widget.dart';
// import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_inventory_widget.dart';
// import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_pricing_widget.dart';
//
//
// class AddProductScreen extends StatefulWidget {
//   const AddProductScreen({super.key});
//
//   @override
//   State<AddProductScreen> createState() => _AddProductScreenState();
// }
//
// class _AddProductScreenState extends State<AddProductScreen> {
//
//   final _formKey = GlobalKey<FormState>();
//
//   final productNameController = TextEditingController();
//   final brandController = TextEditingController();
//   final skuController = TextEditingController();
//
//   final sellingPriceController = TextEditingController();
//   final discountPriceController = TextEditingController();
//   final costPriceController = TextEditingController();
//   final taxController = TextEditingController();
//
//   final stockController = TextEditingController();
//   final weightController = TextEditingController();
//   final lengthController = TextEditingController();
//   final widthController = TextEditingController();
//   final heightController = TextEditingController();
//
//   final descriptionController = TextEditingController();
//   final tagsController = TextEditingController();
//
//   bool isFeatured = false;
//   bool isActive = true;
//   bool isLoading = false;
//
//   @override
//   void dispose() {
//
//     productNameController.dispose();
//     brandController.dispose();
//     skuController.dispose();
//
//     sellingPriceController.dispose();
//     discountPriceController.dispose();
//     costPriceController.dispose();
//     taxController.dispose();
//     stockController.dispose();
//     weightController.dispose();
//     lengthController.dispose();
//     widthController.dispose();
//     heightController.dispose();
//     descriptionController.dispose();
//     tagsController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: AppColors.primaryColor,
//         statusBarIconBrightness: Brightness.light,
//       ),
//
//       child: Scaffold(
//         backgroundColor: const Color(0xffF5F6FA),
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: AppColors.primaryColor,
//           foregroundColor: Colors.white,
//           title: const Text("Add Product",),
//         ),
//         body: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(vertical: 15,),
//             child: Column(
//               children: [
//                 const ProductImagePickerWidget(),
//                 const SizedBox(height: 18),
//                 ProductBasicInfoWidget(
//                   productNameController: productNameController,
//                   brandController: brandController,
//                   skuController: skuController,
//                 ),
//                 const SizedBox(height: 18),
//                 ProductPricingWidget(
//                   sellingPriceController: sellingPriceController,
//                   discountPriceController: discountPriceController,
//                   costPriceController: costPriceController,
//                   taxController: taxController,
//                 ),
//                 const SizedBox(height: 18),
//                 ProductInventoryWidget(
//                   stockController: stockController,
//                   weightController: weightController,
//                   lengthController: lengthController,
//                   widthController: widthController,
//                   heightController: heightController,
//                   isFeatured: isFeatured,
//                   isActive: isActive,
//                   onFeaturedChanged: (value){
//                     setState(() {
//                       isFeatured = value;
//                     });
//                   },
//                   onStatusChanged: (value){
//                     setState(() {
//                       isActive = value;
//                     });
//                   },
//                 ),
//                 const SizedBox(height: 18),
//                 ProductDescriptionWidget(
//                   descriptionController: descriptionController,
//                   tagsController: tagsController,
//                 ),
//                 const SizedBox(height: 30),
//                 ProductActionButtonWidget(
//                   isLoading: isLoading,
//                   onCancel: (){
//                     Navigator.pop(context);
//                   },
//                   onSave: (){
//                     if(_formKey.currentState!.validate()){
//                       /// Future API Call
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }