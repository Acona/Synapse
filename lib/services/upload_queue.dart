import 'dart:io';

class PendingPhoto {
  final String id;
  final File file;
  final DateTime capturedAt;
  final String? machine; // optional for now

  PendingPhoto({
    required this.id,
    required this.file,
    required this.capturedAt,
    this.machine,
  });
}

class UploadQueue {
  // later: enqueue, dequeue, retry/backoff, mark failed/done
  UploadQueue._();
  static final UploadQueue instance = UploadQueue._();

  final List<PendingPhoto> _items = [];
  List<PendingPhoto> get items => List.unmodifiable(_items);

  void add(PendingPhoto p) => _items.insert(0, p);
  void remove(String id) => _items.removeWhere((e) => e.id == id);
  void clear() => _items.clear();
}
