import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';

import '../../../core/constants/app_colors.dart';


class ChatInputWidget extends StatefulWidget {

  final TextEditingController controller;
  final VoidCallback onSendPressed;
  final VoidCallback? onAttachmentPressed;
  final VoidCallback? onEmojiPressed;
  final VoidCallback? onVoicePressed;


  const ChatInputWidget({
    super.key,
    required this.controller,
    required this.onSendPressed,
    this.onAttachmentPressed,
    this.onEmojiPressed,
    this.onVoicePressed,
  });

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}



class _ChatInputWidgetState extends State<ChatInputWidget> {
  bool hasText = false;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        hasText = widget.controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0,-2),
          ),
        ],
      ),

      child: SafeArea(
        child: Row(
          children: [
            /// Attachment Button
            InkWell(
              onTap: widget.onAttachmentPressed,
              child: Container(
                padding: EdgeInsets.all(8.w),
                child: Icon(
                  Iconsax.add_circle,
                  color: AppColors.primaryColor,
                  size: 26.sp,
                ),
              ),
            ),
            SizedBox(width: 5.w),
            /// Message Field
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w,),
                decoration: BoxDecoration(
                  color: const Color(0xffF5F6FA),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child:CustomTextFormFieldWidget(
                  controller: widget.controller,
                  fillColor: const Color(0xffF5F6FA),
                  hintText: "Type a message...",
                  onChanged: (value){
                    setState(() {
                      hasText = value.trim().isNotEmpty;
                    });
                  },
                )

              ),
            ),
            SizedBox(width: 8.w),
            /// Send / Voice Button
            GestureDetector(
              onTap: hasText ? widget.onSendPressed : widget.onVoicePressed,
              child: Container(
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  hasText ? Iconsax.send_1 : Iconsax.microphone,
                  color:Colors.white, size: 21.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}