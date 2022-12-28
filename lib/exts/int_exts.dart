extension IntExts on int {
  /// Assumes this is an integer representation of a stars-based rating (0-5),
  /// and returns a string representation of it.
  String toStars() {
    if (this < 0 || this > 5) {
      throw ArgumentError('Invalid number of stars: $this');
    }
    return '★★★★★☆☆☆☆☆'.substring(5 - this, 10 - this);
  }
}
