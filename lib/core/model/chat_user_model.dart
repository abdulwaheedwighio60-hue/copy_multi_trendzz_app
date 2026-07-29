class ChatUserModel {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final bool isOnline;
  final bool isAudio;

  ChatUserModel({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    this.isOnline = false,
    this.isAudio = false,
  });
}

class ChatMessageModel {
  final String message;
  final String time;
  final String? imageUrl;
  final bool isMe;
  final bool isImage;
  final bool isAudio;
  final int durationSeconds;

  ChatMessageModel({
    required this.message,
    required this.time,
    this.imageUrl,
    this.isMe = false,
    this.isImage = false,
    this.isAudio = false,
    this.durationSeconds = 0,
  });
}