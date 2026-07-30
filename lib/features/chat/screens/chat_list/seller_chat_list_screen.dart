import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/features/chat/screens/chat_list/seller_chat_screen.dart';
import 'package:multi_trendzz/features/chat/widgets/conversation_card_widget.dart';



class SellerChatListScreen extends StatefulWidget {
  const SellerChatListScreen({super.key});

  @override
  State<SellerChatListScreen> createState() => _SellerChatListScreenState();
}

class _SellerChatListScreenState extends State<SellerChatListScreen> {

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.lightColor,
          title: Text(
            "Messages",
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.lightColor
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.search_normal),
            ),
          ],
        ),

        body: Column(
          children: [
            /// Search
            Padding(
              padding: EdgeInsets.all(16.w),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search conversations...",
                  prefixIcon: const Icon(Iconsax.search_normal),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(14.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            /// Conversation List
            Expanded(
              child: ListView(
                children: [
                  ConversationCardWidget(
                    name: "Ali Ahmed",
                    lastMessage: "Your order has been shipped successfully.",
                    time: "10:25 AM",
                    imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
                    isOnline: true,
                    isUnread: true,
                    unreadCount: 3,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SellerChatScreen(
                            name: "Ali Ahmed",
                            imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
                            isOnline: true,
                          ),
                        ),
                      );
                    },
                  ),

                  ConversationCardWidget(
                    name: "Sarah Khan",
                    lastMessage: "Thank you for your purchase ❤️",
                    time: "Yesterday",
                    imageUrl: "https://randomuser.me/api/portraits/women/44.jpg",
                    isOnline: false,
                    isUnread: false,
                    unreadCount: 0,
                  ),

                  ConversationCardWidget(
                    name: "John Smith",
                    lastMessage: "Can you share more product images?",
                    time: "Mon",
                    imageUrl: "https://randomuser.me/api/portraits/men/75.jpg",
                    isOnline: true,
                    isUnread: true,
                    unreadCount: 1,
                  ),

                  ConversationCardWidget(
                    name: "Emma Watson",
                    lastMessage: "Payment received successfully.",
                    time: "Sun",
                    imageUrl: "https://randomuser.me/api/portraits/women/68.jpg",
                    isOnline: false,
                  ),

                  ConversationCardWidget(
                    name: "Ahmed Raza",
                    lastMessage: "When will my parcel arrive?",
                    time: "Sat",
                    imageUrl: "https://randomuser.me/api/portraits/men/45.jpg",
                    isOnline: true,
                    isUnread: true,
                    unreadCount: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}