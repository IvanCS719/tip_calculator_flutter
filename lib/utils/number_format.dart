num formatDecimalNumber(double value) {
  if (value % 1 == 0) {
    return value.toInt();
  } else {
    return double.parse(value.toStringAsFixed(2));
  }
} 