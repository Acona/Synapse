enum UploadStatus { pending, uploading, failed, done }

class UploadTask {
  final String id;        // uuid
  final String imageId;   // FK -> ImageItem.id
  final UploadStatus status;
  final int retryCount;
  final String? lastError;
  final int updatedAt;

  UploadTask({
    required this.id,
    required this.imageId,
    required this.status,
    this.retryCount = 0,
    this.lastError,
    required this.updatedAt,
  });
}
