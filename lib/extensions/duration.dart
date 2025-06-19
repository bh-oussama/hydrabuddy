import '../generated/l10n.dart';

extension DurationExtension on Duration {
  String get agoText {
    final StringBuffer buffer = StringBuffer();
    if (inHours > 0) buffer.write(S.current.xHours(inHours));
    buffer.write(S.current.xHours(inMinutes % 60));
    return buffer.toString();
  }
}
