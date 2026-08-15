import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class SellerStoreScreen extends StatefulWidget {
  const SellerStoreScreen({super.key});

  @override
  State<SellerStoreScreen> createState() => _SellerStoreScreenState();
}

class _SellerStoreScreenState extends State<SellerStoreScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final storeNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  String? selectedCategory;
  String? selectedCity;

  bool isLoading = false;

  final List<String> categories = [
    'Fashion',
    'Electronics',
    'Mobiles',
    'Beauty & Personal Care',
    'Home & Kitchen',
    'Sports',
    'Books',
    'Grocery',
    'Jewelry',
    'Other',
  ];

  final List<String> cities = [
    'Karachi',
    'Lahore',
    'Islamabad',
    'Rawalpindi',
    'Hyderabad',
    'Nawabshah',
    'Multan',
    'Peshawar',
    'Quetta',
    'Other',
  ];

  @override
  void dispose() {
    storeNameController.dispose();
    descriptionController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffF5F6FA),

        // --------------------------------------------------------
        // APP BAR
        // --------------------------------------------------------

        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Create Store',
            style: AppTextStyles.titleMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        // --------------------------------------------------------
        // BODY
        // --------------------------------------------------------

        body: Form(
          key: _formKey,

          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),

            padding: EdgeInsets.fromLTRB(
              16.w,
              18.h,
              16.w,
              35.h,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                // ------------------------------------------------
                // HEADER
                // ------------------------------------------------

                Text(
                  'Create Your Store',
                  style: AppTextStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 5.h),

                Text(
                  'Set up your store and start selling your products.',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),

                SizedBox(height: 20.h),

                // ------------------------------------------------
                // STORE LOGO
                // ------------------------------------------------

                _buildSectionCard(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(
                        'Store Logo',
                        style:
                        AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: 5.h),

                      Text(
                        'Add a logo that represents your store.',
                        style:
                        AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      Center(
                        child: GestureDetector(
                          onTap: _pickStoreLogo,

                          child: Container(
                            width: 105.w,
                            height: 105.w,

                            decoration: BoxDecoration(
                              color: AppColors.primaryColor
                                  .withOpacity(.06),

                              shape: BoxShape.circle,

                              border: Border.all(
                                color: AppColors.primaryColor
                                    .withOpacity(.25),

                                width: 1.5,
                              ),
                            ),

                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,

                              children: [

                                Icon(
                                  Icons
                                      .add_photo_alternate_outlined,

                                  size: 32.sp,

                                  color:
                                  AppColors.primaryColor,
                                ),

                                SizedBox(height: 5.h),

                                Text(
                                  'Add Logo',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight:
                                    FontWeight.w600,
                                    color:
                                    AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                // ------------------------------------------------
                // STORE INFORMATION
                // ------------------------------------------------

                _buildSectionCard(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      _sectionTitle(
                        'Store Information',
                        'Tell customers about your store.',
                      ),

                      SizedBox(height: 18.h),

                      _buildTextField(
                        controller:
                        storeNameController,

                        label:
                        'Store Name',

                        hint:
                        'Enter your store name',

                        prefixIcon:
                        Icons.storefront_outlined,

                        validator: (value) {

                          if (value == null ||
                              value.trim().isEmpty) {

                            return 'Please enter store name';
                          }

                          if (value.trim().length < 3) {

                            return 'Store name must be at least 3 characters';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 16.h),

                      _buildTextField(
                        controller:
                        descriptionController,

                        label:
                        'Store Description',

                        hint:
                        'Describe your store',

                        prefixIcon:
                        Icons.description_outlined,

                        maxLines: 4,

                        validator: (value) {

                          if (value == null ||
                              value.trim().isEmpty) {

                            return 'Please enter store description';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 16.h),

                      _buildDropdown(
                        label:
                        'Category',

                        hint:
                        'Select store category',

                        value:
                        selectedCategory,

                        icon:
                        Icons.category_outlined,

                        items:
                        categories,

                        onChanged: (value) {

                          setState(() {
                            selectedCategory = value;
                          });
                        },

                        validator: (value) {

                          if (value == null ||
                              value.isEmpty) {

                            return 'Please select category';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                // ------------------------------------------------
                // CONTACT INFORMATION
                // ------------------------------------------------

                _buildSectionCard(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      _sectionTitle(
                        'Contact Information',
                        'Provide contact details for your customers.',
                      ),

                      SizedBox(height: 18.h),

                      _buildTextField(
                        controller:
                        phoneController,

                        label:
                        'Phone Number',

                        hint:
                        '03XX XXXXXXX',

                        prefixIcon:
                        Icons.phone_outlined,

                        keyboardType:
                        TextInputType.phone,

                        validator: (value) {

                          if (value == null ||
                              value.trim().isEmpty) {

                            return 'Please enter phone number';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 16.h),

                      _buildTextField(
                        controller:
                        addressController,

                        label:
                        'Store Address',

                        hint:
                        'Enter complete store address',

                        prefixIcon:
                        Icons.location_on_outlined,

                        maxLines: 3,

                        validator: (value) {

                          if (value == null ||
                              value.trim().isEmpty) {

                            return 'Please enter store address';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 16.h),

                      _buildDropdown(
                        label:
                        'City',

                        hint:
                        'Select city',

                        value:
                        selectedCity,

                        icon:
                        Icons.location_city_outlined,

                        items:
                        cities,

                        onChanged: (value) {

                          setState(() {
                            selectedCity = value;
                          });
                        },

                        validator: (value) {

                          if (value == null ||
                              value.isEmpty) {

                            return 'Please select city';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 18.h),

                // ------------------------------------------------
                // STORE POLICY / INFO
                // ------------------------------------------------

                _buildInfoCard(),

                SizedBox(height: 22.h),

                // ------------------------------------------------
                // CREATE STORE BUTTON
                // ------------------------------------------------

                SizedBox(
                  width: double.infinity,
                  height: 52.h,

                  child: ElevatedButton(
                    onPressed:
                    isLoading
                        ? null
                        : _createStore,

                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor:
                      AppColors.primaryColor,

                      foregroundColor:
                      Colors.white,

                      elevation: 0,

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                          13.r,
                        ),
                      ),
                    ),

                    child: isLoading

                        ? SizedBox(
                      width: 22.w,
                      height: 22.w,

                      child:
                      const CircularProgressIndicator(
                        strokeWidth: 2.2,
                        color: Colors.white,
                      ),
                    )

                        : Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        Icon(
                          Icons.storefront_rounded,
                          size: 20.sp,
                        ),

                        SizedBox(width: 8.w),

                        Text(
                          'Create Store',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight:
                            FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                Center(
                  child: Text(
                    'Your store will be reviewed before approval.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SECTION CARD
  // ============================================================

  Widget _buildSectionCard({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.all(16.w),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(16.r),

        border: Border.all(
          color: Colors.grey.shade200,
        ),

        boxShadow: [
          BoxShadow(
            color:
            Colors.black.withOpacity(.025),

            blurRadius: 8,

            offset:
            const Offset(0, 3),
          ),
        ],
      ),

      child: child,
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _sectionTitle(
      String title,
      String subtitle,
      ) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          title,
          style:
          AppTextStyles.titleMedium.copyWith(
            fontWeight:
            FontWeight.w700,
          ),
        ),

        SizedBox(height: 4.h),

        Text(
          subtitle,
          style:
          AppTextStyles.bodySmall.copyWith(
            color:
            Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // TEXT FIELD
  // ============================================================

  Widget _buildTextField({

    required TextEditingController
    controller,

    required String label,

    required String hint,

    required IconData prefixIcon,

    String? Function(String?)?
    validator,

    TextInputType? keyboardType,

    int maxLines = 1,

  }) {

    return TextFormField(

      controller:
      controller,

      keyboardType:
      keyboardType,

      maxLines:
      maxLines,

      validator:
      validator,

      style: TextStyle(
        fontSize: 13.sp,
        fontWeight:
        FontWeight.w500,
      ),

      decoration:
      InputDecoration(

        labelText:
        label,

        hintText:
        hint,

        prefixIcon:
        Icon(
          prefixIcon,
          size: 20.sp,
          color:
          Colors.grey.shade600,
        ),

        filled:
        true,

        fillColor:
        const Color(
          0xffF8F9FB,
        ),

        contentPadding:
        EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 14.h,
        ),

        border:
        OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(
            12.r,
          ),

          borderSide:
          BorderSide(
            color:
            Colors.grey.shade200,
          ),
        ),

        enabledBorder:
        OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(
            12.r,
          ),

          borderSide:
          BorderSide(
            color:
            Colors.grey.shade200,
          ),
        ),

        focusedBorder:
        OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(
            12.r,
          ),

          borderSide:
          BorderSide(
            color:
            AppColors.primaryColor,
            width: 1.3,
          ),
        ),

        errorBorder:
        OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(
            12.r,
          ),

          borderSide:
          const BorderSide(
            color: Colors.red,
          ),
        ),

        focusedErrorBorder:
        OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(
            12.r,
          ),

          borderSide:
          const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DROPDOWN
  // ============================================================

  Widget _buildDropdown({

    required String label,

    required String hint,

    required String? value,

    required IconData icon,

    required List<String> items,

    required ValueChanged<String?>
    onChanged,

    String? Function(String?)?
    validator,

  }) {

    return DropdownButtonFormField<String>(

      value:
      value,

      isExpanded:
      true,

      onChanged:
      onChanged,

      validator:
      validator,

      icon:
      Icon(
        Icons.keyboard_arrow_down_rounded,
        color:
        Colors.grey.shade600,
      ),

      style: TextStyle(
        fontSize: 13.sp,
        color:
        Colors.black87,
        fontWeight:
        FontWeight.w500,
      ),

      decoration:
      InputDecoration(

        labelText:
        label,

        hintText:
        hint,

        prefixIcon:
        Icon(
          icon,
          size: 20.sp,
          color:
          Colors.grey.shade600,
        ),

        filled:
        true,

        fillColor:
        const Color(
          0xffF8F9FB,
        ),

        contentPadding:
        EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 5.h,
        ),

        border:
        OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(
            12.r,
          ),

          borderSide:
          BorderSide(
            color:
            Colors.grey.shade200,
          ),
        ),

        enabledBorder:
        OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(
            12.r,
          ),

          borderSide:
          BorderSide(
            color:
            Colors.grey.shade200,
          ),
        ),

        focusedBorder:
        OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(
            12.r,
          ),

          borderSide:
          BorderSide(
            color:
            AppColors.primaryColor,
            width: 1.3,
          ),
        ),
      ),

      items:
      items.map(
            (item) {

          return DropdownMenuItem<String>(

            value:
            item,

            child:
            Text(
              item,

              overflow:
              TextOverflow.ellipsis,
            ),
          );
        },
      ).toList(),
    );
  }

  // ============================================================
  // INFO CARD
  // ============================================================

  Widget _buildInfoCard() {

    return Container(

      padding:
      EdgeInsets.all(14.w),

      decoration:
      BoxDecoration(

        color:
        AppColors.primaryColor
            .withOpacity(.06),

        borderRadius:
        BorderRadius.circular(
          13.r,
        ),

        border:
        Border.all(
          color:
          AppColors.primaryColor
              .withOpacity(.14),
        ),
      ),

      child: Row(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Container(

            width: 34.w,
            height: 34.w,

            decoration:
            BoxDecoration(

              color:
              AppColors.primaryColor
                  .withOpacity(.12),

              shape:
              BoxShape.circle,
            ),

            child:
            Icon(
              Icons.verified_user_outlined,
              color:
              AppColors.primaryColor,
              size: 19.sp,
            ),
          ),

          SizedBox(width: 10.w),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  'Store Verification',
                  style:
                  AppTextStyles.bodyMedium.copyWith(
                    fontWeight:
                    FontWeight.w700,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  'After submitting your store, our admin team will review your information. You will be able to access the seller dashboard once your store is approved.',
                  style:
                  AppTextStyles.bodySmall.copyWith(
                    color:
                    Colors.grey.shade700,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PICK LOGO
  // ============================================================

  void _pickStoreLogo() {

    // TODO:
    // ImagePicker implement karna hai.

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          'Store logo picker will be implemented here.',
        ),
      ),
    );
  }

  // ============================================================
  // CREATE STORE
  // ============================================================

  Future<void> _createStore() async {

    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    // ========================================================
    // TODO:
    // Yahan API call hogi
    //
    // POST /stores
    //
    // {
    //   "storeName": storeNameController.text,
    //   "description": descriptionController.text,
    //   "category": selectedCategory,
    //   "phone": phoneController.text,
    //   "address": addressController.text,
    //   "city": selectedCity
    // }
    // ========================================================

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    // --------------------------------------------------------
    // Temporary success
    // Later API success ke baad ye karna hai.
    // --------------------------------------------------------

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          'Store created successfully.',
        ),
      ),
    );

    // TODO:
    // API success ke baad:
    //
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => const StorePendingScreen(),
    //   ),
    // );
  }
}