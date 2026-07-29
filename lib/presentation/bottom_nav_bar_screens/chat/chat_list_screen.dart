import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/chat_user_model.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<ChatUserModel> chatUsers = [
    ChatUserModel(
      name: 'Carla Schoen',
      message: 'Perfect, will check it',
      time: '09:34 PM',
      imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300',
      isOnline: true,
    ),
    ChatUserModel(
      name: 'Sheila Lemke',
      message: 'Thanks',
      time: '09:34 PM',
      imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300',
      isOnline: true,
    ),
    ChatUserModel(
      name: 'Deanna Botsford V',
      message: 'Welcome!',
      time: '09:34 PM',
      imageUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300',
      isOnline: false,
    ),
    ChatUserModel(
      name: 'Mr. Katie Bergnaum',
      message: 'Good Morning!',
      time: '09:34 PM',
      imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=300',
      isOnline: true,
    ),
    ChatUserModel(
      name: 'Armando Ferry',
      message: 'Share Image Please!',
      time: '09:34 PM',
      imageUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=300',
      isOnline: false,
    ),
    ChatUserModel(
      name: 'Annette Fritsch',
      message: 'Thanks!',
      time: '09:34 PM',
      imageUrl: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=300',
      isOnline: true,
    ),
    ChatUserModel(
      name: 'Annette Fritsch',
      message: 'Thanks!',
      time: '09:34 PM',
      imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=300',
      isOnline: true,
    ),
  ];

  List<ChatUserModel> get filteredUsers {
    final String query = searchController.text.trim().toLowerCase();

    if (query.isEmpty) {
      return chatUsers;
    }

    return chatUsers.where((ChatUserModel user) {
      return user.name.toLowerCase().contains(query) ||
          user.message.toLowerCase().contains(query);
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void openChat(ChatUserModel user) {
    context.push(AppRoutes.chatDetailScreen, extra: user);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightColor,
        body: Stack(
          children: [
            Container(
              height: 250.h,
              width: double.infinity,
              color: AppColors.primaryColor,
            ),

            SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 8.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        CustomBackButtonWidget(
                          onTap: () {
                            if (context.canPop()) {
                              context.pop();
                            } else {
                              context.go(AppRoutes.rootScreen);
                            }
                          },
                        ),

                        Expanded(
                          child: Center(
                            child: Text(
                              'Chat',
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 44.w),
                      ],
                    ),
                  ),

                  SizedBox(height: 28.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: _buildSearchField(),
                  ),

                  SizedBox(height: 22.h),

                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 0),
                      decoration: BoxDecoration(
                        color: AppColors.lightColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28.r),
                          topRight: Radius.circular(28.r),
                        ),
                      ),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: filteredUsers.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10.h);
                        },
                        itemBuilder: (context, index) {
                          final ChatUserModel user = filteredUsers[index];

                          return _buildChatUserTile(user);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: searchController,
        cursorColor: AppColors.primaryColor,
        onChanged: (_) {
          setState(() {});
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search shop owner',
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textHint,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(
            Iconsax.search_normal_1,
            color: AppColors.primaryColor,
            size: 22.sp,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        ),
      ),
    );
  }

  Widget _buildChatUserTile(ChatUserModel user) {
    return GestureDetector(
      onTap: () => openChat(user),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.03),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: AppColors.primaryLight,
                  backgroundImage: NetworkImage(user.imageUrl),
                ),

                if (user.isOnline)
                  Positioned(
                    right: 1.w,
                    bottom: 2.h,
                    child: Container(
                      width: 9.w,
                      height: 9.w,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white,
                          width: 1.5.w,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 3.h),

                  Text(
                    user.message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 8.w),

            Text(
              user.time,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}