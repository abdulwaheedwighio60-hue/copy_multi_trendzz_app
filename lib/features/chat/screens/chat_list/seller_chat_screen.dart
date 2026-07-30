import 'package:file_picker/file_picker.dart' as fp;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/features/chat/widgets/chat_input_widget.dart';
import 'package:multi_trendzz/features/chat/widgets/custom_app_bar_widget.dart';
import 'package:multi_trendzz/features/chat/widgets/date_sepration_widget.dart';
import 'package:multi_trendzz/features/chat/widgets/message_bubble_widget.dart';
import 'package:multi_trendzz/features/chat/widgets/typing_indicator_widget.dart';
class SellerChatScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  final bool isOnline;

  const SellerChatScreen({
    super.key,
    required this.name,
    required this.imageUrl,
    this.isOnline = false,
  });

  @override
  State<SellerChatScreen> createState() => _SellerChatScreenState();
}

class _SellerChatScreenState extends State<SellerChatScreen> {
  final TextEditingController messageController = TextEditingController();

  final List<Map<String, dynamic>> messages = [

    {
      "message": "Hello, I want to know about this product.",
      "time": "10:20 AM",
      "isSender": false,
      "isSeen": false,
    },

    {
      "message": "Sure, I can help you with that.",
      "time": "10:21 AM",
      "isSender": true,
      "isSeen": true,
    },

  ];

  Future<void> pickImage() async {


    final ImagePicker picker = ImagePicker();


    final XFile? image =
    await picker.pickImage(

      source:
      ImageSource.gallery,

    );


    if(image != null){

      print(
          "Image Path: ${image.path}"
      );

    }

  }
  Future<void> pickVideo() async {


    final ImagePicker picker =
    ImagePicker();


    final XFile? video =
    await picker.pickVideo(

      source:
      ImageSource.gallery,

    );


    if(video != null){

      print(
          "Video Path: ${video.path}"
      );

    }

  }

  Future<void> pickDocument() async {
    fp.FilePickerResult? result =
    await fp.FilePicker.pickFiles();
    if(result != null){
      print(
          result.files.single.path
      );
    }
  }


  Future<void> pickAudio() async {

    fp.FilePickerResult? result =
    await fp.FilePicker.pickFiles(
      type: fp.FileType.audio,
    );
    if(result != null){
      print("Audio Path: ${result.files.single.path}");
    }
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
        appBar: ChatAppBarWidget(
          name: widget.name,
          imageUrl: widget.imageUrl,
          isOnline: widget.isOnline,
          onCallPressed: () {},
          onMorePressed: () {},
        ),

        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10.h,),
                children: [
                  DateSeparatorWidget(date: "Today",),
                  MessageBubbleWidget(
                    message: "Hello, I want to know about this product.",
                    time: "10:20 AM",
                    isSender: false,
                  ),
                  MessageBubbleWidget(
                    message: "Sure, I can help you with that.",
                    time: "10:21 AM",
                    isSender: true,
                    isSeen: true,
                  ),
                  MessageBubbleWidget(
                    message: "Can you share more images?",
                    time: "10:22 AM",
                    isSender: false,
                  ),

                  MessageBubbleWidget(
                    message: "Yes, I have shared images.",
                    time: "10:23 AM",
                    isSender: true,
                    isSeen: true,
                  ),


                  ...messages.map((msg) {

                    return MessageBubbleWidget(
                      message: msg["message"],
                      time: msg["time"],
                      isSender: msg["isSender"],
                      isSeen: msg["isSeen"],
                    );

                  }).toList(),



                  SizedBox(height: 5.h),
                  TypingIndicatorWidget(
                    userName:widget.name,
                  ),
                ],
              ),
            ),
            ChatInputWidget(
              controller: messageController,
              onSendPressed: () {
                if(messageController.text.trim().isNotEmpty){
                  setState(() {
                    messages.add({
                      "message": messageController.text.trim(),
                      "time": "Now",
                      "isSender": true,
                      "isSeen": false,
                    });
                  });
                  messageController.clear();
                }
              },
              onAttachmentPressed: showAttachmentOptions,
              onEmojiPressed: () {},
              onVoicePressed: () {},
            ),
          ],
        ),
      ),
    );
  }
  void showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 14.w,
              mainAxisSpacing: 18.h,
              childAspectRatio: .82,
              children: [

                _attachmentItem(
                  icon: Iconsax.gallery,
                  label: "Gallery",
                  color: Colors.blue,
                  onTap: () {
                    Navigator.pop(context);
                    pickImage();
                  },
                ),

                _attachmentItem(
                  icon: Iconsax.video,
                  label: "Video",
                  color: Colors.pink,
                  onTap: () {
                    Navigator.pop(context);
                    pickVideo();
                  },
                ),

                _attachmentItem(
                  icon: Iconsax.document,
                  label: "Document",
                  color: Colors.deepPurple,
                  onTap: () {
                    Navigator.pop(context);
                    pickDocument();
                  },
                ),

                _attachmentItem(
                  icon: Iconsax.music,
                  label: "Audio",
                  color: Colors.orange,
                  onTap: () {
                    Navigator.pop(context);
                    pickAudio();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }




  Widget _attachmentItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22.r),
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            width: 65.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Icon(
              icon,
              color: color,
              size: 23.sp,
            ),
          ),

          SizedBox(height: 8.h),

          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}