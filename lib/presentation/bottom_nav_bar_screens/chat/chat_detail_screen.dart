import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
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
import 'package:path_provider/path_provider.dart';
// import 'package:record/record.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({
    super.key,
    this.user,
  });

  final ChatUserModel? user;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  // final AudioRecorder audioRecorder = AudioRecorder();
  final AudioPlayer audioPlayer = AudioPlayer();
  final TextEditingController messageController = TextEditingController();

  late ChatUserModel user;

  bool isRecording = false;
  bool isPlayingAudio = false;
  String? currentlyPlayingPath;
  String? recordedAudioPath;
  Timer? recordingTimer;
  int recordingSeconds = 0;

  final List<ChatMessageModel> messages = [
    ChatMessageModel(
      message:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      time: '08:04 pm',
      isMe: false,
    ),
    ChatMessageModel(
      message:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      time: '08:04 pm',
      isMe: true,
    ),
    ChatMessageModel(
      message: '',
      time: '08:04 pm',
      isMe: true,
      isImage: true,
      imageUrl:
      'https://images.unsplash.com/photo-1512316609839-ce289d3eba0a?w=700',
    ),
    ChatMessageModel(
      message: 'dummy_audio',
      time: '08:04 pm',
      isMe: true,
      isAudio: true,
      durationSeconds: 13,
    ),
  ];

  @override
  void initState() {
    super.initState();

    user = widget.user ??
        ChatUserModel(
          name: 'Sheila Lemke',
          message: 'Thanks',
          time: '09:34 PM',
          imageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300',
          isOnline: true,
        );

    audioPlayer.onPlayerComplete.listen((event) {
      if (!mounted) return;

      setState(() {
        isPlayingAudio = false;
        currentlyPlayingPath = null;
      });
    });
  }

  @override
  void dispose() {
    messageController.dispose();
    recordingTimer?.cancel();
    // audioRecorder.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  String _currentTime() {
    final DateTime now = DateTime.now();
    final int hour = now.hour > 12
        ? now.hour - 12
        : now.hour == 0
        ? 12
        : now.hour;
    final String minute = now.minute.toString().padLeft(2, '0');
    final String period = now.hour >= 12 ? 'pm' : 'am';

    return '${hour.toString().padLeft(2, '0')}:$minute $period';
  }

  // Future<void> startVoiceRecording() async {
  //   final bool hasPermission = await audioRecorder.hasPermission();
  //
  //   if (!hasPermission) {
  //     ScaffoldMessenger.of(context)
  //       ..hideCurrentSnackBar()
  //       ..showSnackBar(
  //         SnackBar(
  //           content: const Text('Microphone permission required'),
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: AppColors.primaryColor,
  //         ),
  //       );
  //
  //     return;
  //   }
  //
  //   final directory = await getApplicationDocumentsDirectory();
  //
  //   final String filePath =
  //       '${directory.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';
  //
  //   await audioRecorder.start(
  //     const RecordConfig(
  //       encoder: AudioEncoder.aacLc,
  //       bitRate: 128000,
  //       sampleRate: 44100,
  //     ),
  //     path: filePath,
  //   );
  //
  //   setState(() {
  //     isRecording = true;
  //     recordedAudioPath = null;
  //     recordingSeconds = 0;
  //   });
  //
  //   recordingTimer?.cancel();
  //   recordingTimer = Timer.periodic(const Duration(seconds: 1), (_) {
  //     if (!mounted) return;
  //
  //     setState(() {
  //       recordingSeconds++;
  //     });
  //   });
  // }
  //
  // Future<void> stopVoiceRecording() async {
  //   final int recordedSeconds = recordingSeconds <= 0 ? 1 : recordingSeconds;
  //   final String? path = await audioRecorder.stop();
  //
  //   recordingTimer?.cancel();
  //
  //   setState(() {
  //     isRecording = false;
  //     recordedAudioPath = path;
  //     recordingSeconds = 0;
  //   });
  //
  //   if (path == null) return;
  //
  //   setState(() {
  //     messages.add(
  //       ChatMessageModel(
  //         message: path,
  //         time: _currentTime(),
  //         isMe: true,
  //         isAudio: true,
  //         durationSeconds: recordedSeconds,
  //       ),
  //     );
  //   });
  // }

  // Future<void> toggleVoiceRecording() async {
  //   if (isRecording) {
  //     await stopVoiceRecording();
  //   } else {
  //     await startVoiceRecording();
  //   }
  // }

  Future<void> playRecordedAudio(String path) async {
    if (path == 'dummy_audio') return;

    if (isPlayingAudio && currentlyPlayingPath == path) {
      await audioPlayer.stop();

      setState(() {
        isPlayingAudio = false;
        currentlyPlayingPath = null;
      });

      return;
    }

    await audioPlayer.stop();
    await audioPlayer.play(DeviceFileSource(path));

    setState(() {
      isPlayingAudio = true;
      currentlyPlayingPath = path;
    });
  }

  void sendMessage() {
    final String text = messageController.text.trim();

    if (text.isEmpty) return;

    setState(() {
      messages.add(
        ChatMessageModel(
          message: text,
          time: _currentTime(),
          isMe: true,
        ),
      );

      messageController.clear();
    });
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
              height: 170.h,
              width: double.infinity,
              color: AppColors.primaryColor,
            ),

            SafeArea(
              child: Column(
                children: [
                  _buildHeader(),

                  SizedBox(height: 18.h),

                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 0),
                      decoration: BoxDecoration(
                        color: AppColors.lightColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28.r),
                          topRight: Radius.circular(28.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'T O D A Y',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 4,
                            ),
                          ),

                          SizedBox(height: 16.h),

                          Expanded(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: messages.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 12.h);
                              },
                              itemBuilder: (context, index) {
                                final ChatMessageModel message =
                                messages[index];

                                return _buildMessageItem(message);
                              },
                            ),
                          ),

                          _buildMessageInput(),
                        ],
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

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      child: Row(
        children: [
          CustomBackButtonWidget(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go(AppRoutes.chatListScreen);
              }
            },
          ),

          SizedBox(width: 14.w),

          Stack(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.primaryLight,
                backgroundImage: NetworkImage(user.imageUrl),
              ),

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

          SizedBox(width: 10.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 2.h),

                Text(
                  'Online',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white.withOpacity(0.9),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 44.w,
            height: 44.w,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.more_vert,
              color: AppColors.textPrimary,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(ChatMessageModel message) {
    if (message.isImage) {
      return _buildImageMessage(message);
    }

    if (message.isAudio) {
      return _buildAudioMessage(message);
    }

    return Column(
      crossAxisAlignment:
      message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 250.w),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: message.isMe ? AppColors.primaryColor : AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
              bottomLeft: Radius.circular(message.isMe ? 8.r : 0),
              bottomRight: Radius.circular(message.isMe ? 0 : 8.r),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.04),
                blurRadius: 12.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: Text(
            message.message,
            style: AppTextStyles.bodyMedium.copyWith(
              color: message.isMe ? AppColors.white : AppColors.textPrimary,
              fontSize: 13.sp,
              height: 1.45,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        SizedBox(height: 8.h),

        _buildMessageInfo(message),
      ],
    );
  }

  Widget _buildMessageInfo(ChatMessageModel message) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!message.isMe) ...[
          CircleAvatar(
            radius: 10.r,
            backgroundImage: NetworkImage(user.imageUrl),
          ),
          SizedBox(width: 5.w),
          Text(
            user.name,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 50.w),
        ],

        Text(
          message.time,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

        if (message.isMe) ...[
          SizedBox(width: 50.w),
          CircleAvatar(
            radius: 10.r,
            backgroundImage: const NetworkImage(
              'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300',
            ),
          ),
          SizedBox(width: 5.w),
          Text(
            'Esther Howard',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildImageMessage(ChatMessageModel message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 205.w,
          height: 125.h,
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.04),
                blurRadius: 12.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Image.network(
              message.imageUrl ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(height: 8.h),

        _buildMessageInfo(message),
      ],
    );
  }

  Widget _buildAudioMessage(ChatMessageModel message) {
    final bool isCurrentPlaying =
        isPlayingAudio && currentlyPlayingPath == message.message;

    final int durationSeconds = message.durationSeconds <= 0
        ? 1
        : message.durationSeconds;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 235.w,
          height: 48.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
              bottomLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(0.r),
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  playRecordedAudio(message.message);
                },
                child: Container(
                  width: 26.w,
                  height: 26.w,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isCurrentPlaying
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    color: AppColors.primaryColor,
                    size: 20.sp,
                  ),
                ),
              ),

              SizedBox(width: 8.w),

              Expanded(
                child: Row(
                  children: List.generate(
                    28,
                        (index) {
                      final double height = index.isEven ? 22.h : 12.h;

                      return Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          height: height,
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(
                              isCurrentPlaying
                                  ? index > 20
                                  ? 0.45
                                  : 1
                                  : index > 20
                                  ? 0.35
                                  : 0.95,
                            ),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(width: 8.w),

              Text(
                _formatDuration(durationSeconds),
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8.h),

        _buildMessageInfo(message),
      ],
    );
  }

  Widget _buildMessageInput() {
    final bool hasText = messageController.text.trim().isNotEmpty;

    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 14.h),
        color: AppColors.lightColor,
        child: Container(
          height: 48.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Row(
            children: [
              Container(
                width: 42.w,
                height: 42.w,
                margin: EdgeInsets.only(left: 4.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                  size: 22.sp,
                ),
              ),

              Container(
                width: 1.w,
                height: 24.h,
                color: AppColors.borderColor.withOpacity(0.7),
              ),

              Expanded(
                child: isRecording
                    ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),

                      SizedBox(width: 8.w),

                      Expanded(
                        child: Text(
                          'Recording... ${_formatDuration(recordingSeconds)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    : TextField(
                  controller: messageController,
                  cursorColor: AppColors.primaryColor,
                  onChanged: (_) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type a message here...',
                    hintStyle: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textHint,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
              ),

              // GestureDetector(
              //   onTap: hasText ? sendMessage : toggleVoiceRecording,
              //   child: AnimatedContainer(
              //     duration: const Duration(milliseconds: 200),
              //     width: 36.w,
              //     height: 36.w,
              //     margin: EdgeInsets.only(right: 6.w),
              //     decoration: BoxDecoration(
              //       color: AppColors.primaryColor,
              //       borderRadius: BorderRadius.circular(6.r),
              //     ),
              //     child: Icon(
              //       hasText
              //           ? Iconsax.send_1
              //           : isRecording
              //           ? Icons.stop_rounded
              //           : Iconsax.microphone_2,
              //       color: AppColors.white,
              //       size: 18.sp,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}