class TimeAgoHelper {
  static String format(String dateString) {
    final date = DateTime.parse(dateString);
    final now = DateTime.now();

    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'منذ ${difference.inSeconds} ثانية';
    }

    if (difference.inMinutes < 60) {
      return 'منذ ${difference.inMinutes} دقيقة';
    }

    if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    }

    if (difference.inDays == 1) {
      return 'منذ يوم';
    }

    if (difference.inDays < 7) {
      return 'منذ ${difference.inDays} أيام';
    }

    return _formatDate(date);
  }

  static String _formatDate(DateTime date) {
    final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
    final minute = date.minute.toString().padLeft(2, '0');
    final second = date.second.toString().padLeft(2, '0');

    final period = date.hour >= 12 ? 'مساءً' : 'صباحًا';

    return '${date.day}/${date.month}/${date.year} '
        '$hour:$minute:$second $period';
  }
}
