import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';

class AddSellerDialog extends StatefulWidget {
  final VoidCallback? onSave;

  const AddSellerDialog({
    super.key,
    this.onSave,
  });

  @override
  State<AddSellerDialog> createState() => _AddSellerDialogState();
}

class _AddSellerDialogState extends State<AddSellerDialog> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController storeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String selectedStatus = "Active";

  final List<String> statusList = [
    "Active",
    "Pending",
    "Blocked",
  ];

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;
    final double fontSize = isDesktop
        ? 15
        : isTablet
        ? 14
        : 13;
    return Dialog(
        backgroundColor: Colors.white,
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 15 : 40,
        vertical: 25,
    ),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(22),
    ),

    child: Container(

    width: isDesktop
    ? 720
        : isTablet
    ? 620
        : double.infinity,

    constraints: const BoxConstraints(
    maxHeight: 700,
    ),

    padding: EdgeInsets.all(
    isMobile ? 18 : 28,
    ),

    child: SingleChildScrollView(

    child: Form(
    key: formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,

    children: [
    /// Header
    Row(
      children: [
    Expanded(

    child: Text(

    "Add New Seller",

    style: TextStyle(

    fontSize: isMobile ? 20 : 26,

    fontWeight: FontWeight.bold,

    ),

    ),

    ),

    IconButton(

    onPressed: () {

    Navigator.pop(context);

    },

    icon: const Icon(Icons.close),

    )

    ],

    ),

    const SizedBox(height: 25),

    /// Profile

    Center(

    child: Stack(

    children: [

    CircleAvatar(

    radius: isMobile ? 42 : 50,

    backgroundColor: Colors.grey.shade200,

    child: Icon(

    Icons.person,

    size: isMobile ? 42 : 50,

    color: Colors.grey,

    ),

    ),

    Positioned(

    bottom: 0,

    right: 0,

    child: Container(

    padding: const EdgeInsets.all(7),

    decoration: const BoxDecoration(

    color: AppColors.primaryColor,

    shape: BoxShape.circle,

    ),

    child: const Icon(

    Icons.camera_alt,

    color: Colors.white,

    size: 18,

    ),

    ),

    )

    ],

    ),

    ),

    const SizedBox(height: 30),

    _textField(
    controller: nameController,
    label: "Seller Name",
    icon: Icons.person_outline,
    ),

    const SizedBox(height: 18),

    _textField(
    controller: storeController,
    label: "Store Name",
    icon: Icons.store_outlined,
    ),

    const SizedBox(height: 18),

    _textField(
    controller: emailController,
    label: "Email Address",
    icon: Icons.email_outlined,
    ),

    const SizedBox(height: 18),

    isMobile

    ? Column(

    children: [

    _textField(

    controller: phoneController,

    label: "Phone Number",

    icon: Icons.phone_outlined,

    ),

    const SizedBox(height: 18),

    _textField(

    controller: passwordController,

    label: "Password",

    icon: Icons.lock_outline,

    obscure: true,

    ),

    ],

    )

        : Row(

    children: [

    Expanded(

    child: _textField(

    controller: phoneController,

    label: "Phone Number",

    icon: Icons.phone_outlined,

    ),

    ),

    const SizedBox(width: 18),

    Expanded(

    child: _textField(

    controller: passwordController,

    label: "Password",

    icon: Icons.lock_outline,

    obscure: true,

    ),

    ),

    ],

    ),

    const SizedBox(height: 18),

      DropdownButtonFormField<String>(
        value: selectedStatus,

        isExpanded: true,

        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: isDesktop ? 24 : isTablet ? 22 : 20,
        ),

        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),

        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.toggle_on_outlined,
            size: isDesktop ? 22 : 20,
            color: Colors.grey.shade600,
          ),

          contentPadding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 18 : 16,
            vertical: isDesktop ? 18 : 15,
          ),

          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 1.5,
            ),
          ),
        ),

        items: statusList.map((status) {
          return DropdownMenuItem<String>(
            value: status,
            child: Text(
              status,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          );
        }).toList(),

        onChanged: (value) {
          setState(() {
            selectedStatus = value!;
          });
        },
      ),

    const SizedBox(height: 28),

    /// Buttons
      isMobile
          ? Column(
        children: [

          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.grey.shade300,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {

                if (formKey.currentState!.validate()) {

                  widget.onSave?.call();

                  Navigator.pop(context);

                }

              },
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: const Text(
                "Save Seller",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          ResponsiveDialogButton(
            text: "Cancel",
            isPrimary: false,
            icon: Icons.close,
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          ResponsiveDialogButton(
            text: "Update",
            backgroundColor: AppColors.primaryColor,
            icon: Icons.edit,
            onPressed: () {

              /// Update API

              Navigator.pop(context);

            },
          ),
        ],
      ),

    ],
    ),
    ),
    ),
    ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscure = false,
  }) {

    final bool isMobile =
        MediaQuery.of(context).size.width < 700;

    return TextFormField(
      controller: controller,
      obscureText: obscure,

      style: TextStyle(
        fontSize: isMobile ? 13 : 15,
      ),

      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Required field";
        }
        return null;
      },

      decoration: _inputDecoration(label, icon),
    );
  }

  InputDecoration _inputDecoration(
      String label,
      IconData icon,
      ) {

    final bool isMobile =
        MediaQuery.of(context).size.width < 700;

    return InputDecoration(

      labelText: label,

      labelStyle: TextStyle(
        fontSize: isMobile ? 13 : 14,
      ),

      prefixIcon: Icon(
        icon,
        size: isMobile ? 20 : 22,
      ),

      filled: true,

      fillColor: const Color(0xffF8F9FB),

      contentPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14 : 18,
        vertical: 16,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),

      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    storeController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}