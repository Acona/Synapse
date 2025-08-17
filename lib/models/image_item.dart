class ImageItem {
  final String id; // uuid
  final String filePath; // full path on device
  final int createdAt; // epoch ms
  final int? width;
  final int? height;
  final int? fileSize; // bytes
  final String? thumbPath;

  ImageItem({
    required this.id,
    required this.filePath,
    required this.createdAt,
    this.width,
    this.height,
    this.fileSize,
    this.thumbPath,
  });
}
