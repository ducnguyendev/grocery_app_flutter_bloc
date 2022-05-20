int getTimestamp(DateTime value) {
  final double timestamp = value.millisecondsSinceEpoch / 1000;
  return timestamp.round();
}