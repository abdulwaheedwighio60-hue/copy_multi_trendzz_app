import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';

import 'customer_card_widget.dart';

class CustomerListWidget extends StatelessWidget {
  const CustomerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customers = [
      {
        "image":
        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300&q=80",
        "name": "Abdul Waheed",
        "email": "abdulwaheed@gmail.com",
        "phone": "+92 300 1234567",
        "orders": 28,
        "spent": 4250.0,
        "premium": true,
      },
      {
        "image":
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300&q=80",
        "name": "Sara Khan",
        "email": "sara@gmail.com",
        "phone": "+92 321 6549871",
        "orders": 17,
        "spent": 1980.0,
        "premium": false,
      },
      {
        "image":
        "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=300&q=80",
        "name": "Ahmed Ali",
        "email": "ahmed@gmail.com",
        "phone": "+92 333 1112233",
        "orders": 45,
        "spent": 8120.0,
        "premium": true,
      },
      {
        "image":
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=300&q=80",
        "name": "Ayesha Malik",
        "email": "ayesha@gmail.com",
        "phone": "+92 300 8889999",
        "orders": 10,
        "spent": 980.0,
        "premium": false,
      },
      {
        "image":
        "https://images.unsplash.com/photo-1504593811423-6dd665756598?w=300&q=80",
        "name": "Usman Tariq",
        "email": "usman@gmail.com",
        "phone": "+92 301 1122334",
        "orders": 31,
        "spent": 5360.0,
        "premium": true,
      },
      {
        "image":
        "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=300&q=80",
        "name": "Fatima Noor",
        "email": "fatima@gmail.com",
        "phone": "+92 302 4455667",
        "orders": 19,
        "spent": 2450.0,
        "premium": false,
      },
      {
        "image":
        "https://images.unsplash.com/photo-1502767089025-6572583495b0?w=300&q=80",
        "name": "Bilal Hassan",
        "email": "bilal@gmail.com",
        "phone": "+92 300 5557788",
        "orders": 52,
        "spent": 10250.0,
        "premium": true,
      },
      {
        "image":
        "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=300&q=80",
        "name": "Zain Ali",
        "email": "zain@gmail.com",
        "phone": "+92 345 1114455",
        "orders": 15,
        "spent": 1680.0,
        "premium": false,
      },
      {
        "image":
        "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300&q=80",
        "name": "Hina Shah",
        "email": "hina@gmail.com",
        "phone": "+92 333 7894561",
        "orders": 36,
        "spent": 6450.0,
        "premium": true,
      },
      {
        "image":
        "https://images.unsplash.com/photo-1504257432389-52343af06ae3?w=300&q=80",
        "name": "Hamza Khan",
        "email": "hamza@gmail.com",
        "phone": "+92 321 9876543",
        "orders": 22,
        "spent": 3150.0,
        "premium": false,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView.builder(
        itemCount: customers.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final customer = customers[index];

          return CustomerCardWidget(
            image: customer["image"] as String,
            name: customer["name"] as String,
            email: customer["email"] as String,
            phone: customer["phone"] as String,
            totalOrders: customer["orders"] as int,
            totalSpent: customer["spent"] as double,
            isPremium: customer["premium"] as bool,
            onTap: () {
              // Navigate to Customer Detail Screen
              context.push(AppRoutes.customerDetailScreen);
            },
          );
        },
      ),
    );
  }
}