import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_action_button_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_basic_info_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_description_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_image_picker_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_inventory_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/add_product/widgets/product_pricing_widget.dart';


class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final productNameController = TextEditingController();
  final brandController = TextEditingController();
  final skuController = TextEditingController();

  final sellingPriceController = TextEditingController();
  final discountPriceController = TextEditingController();
  final costPriceController = TextEditingController();
  final taxController = TextEditingController();

  final stockController = TextEditingController();
  final weightController = TextEditingController();
  final lengthController = TextEditingController();
  final widthController = TextEditingController();
  final heightController = TextEditingController();

  final descriptionController = TextEditingController();
  final tagsController = TextEditingController();

  bool isFeatured = true;
  bool isActive = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    /// Dummy Product Data
    productNameController.text = "Nike Air Max Sneakers";
    brandController.text = "Nike";
    skuController.text = "NK-1001";

    sellingPriceController.text = "149.99";
    discountPriceController.text = "129.99";
    costPriceController.text = "90.00";
    taxController.text = "10";

    stockController.text = "45";
    weightController.text = "0.85";

    lengthController.text = "30";
    widthController.text = "18";
    heightController.text = "12";

    descriptionController.text =
    "Nike Air Max is designed with premium cushioning technology for maximum comfort. It features a breathable mesh upper, lightweight sole, durable rubber outsole and modern styling.";

    tagsController.text =
    "Nike, Shoes, Running, Sports, Men";
  }

  @override
  void dispose() {
    productNameController.dispose();
    brandController.dispose();
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
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffF5F6FA),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          title: const Text("Edit Product"),
        ),

        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [

                /// Images
                const ProductImagePickerWidget(),

                const SizedBox(height: 18),

                /// Basic Info
                ProductBasicInfoWidget(
                  productNameController: productNameController,
                  brandController: brandController,
                  skuController: skuController,
                ),

                const SizedBox(height: 18),

                /// Pricing
                ProductPricingWidget(
                  sellingPriceController: sellingPriceController,
                  discountPriceController: discountPriceController,
                  costPriceController: costPriceController,
                  taxController: taxController,
                ),

                const SizedBox(height: 18),

                /// Inventory
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

                const SizedBox(height: 18),

                /// Description
                ProductDescriptionWidget(
                  descriptionController: descriptionController,
                  tagsController: tagsController,
                ),

                const SizedBox(height: 30),

                /// Action Buttons
                ProductActionButtonWidget(
                  isLoading: isLoading,

                  onCancel: () {
                    Navigator.pop(context);
                  },

                  onSave: () {
                    if (_formKey.currentState!.validate()) {

                      /// TODO:
                      /// Update Product API

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Product Updated Successfully",
                          ),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}