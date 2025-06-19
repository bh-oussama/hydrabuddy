import 'dart:math';

extension ExtensionDouble on double {
  double roundToFractions(int fractions) {
    final num denominator = pow(10.0, fractions);
    return (this * denominator).roundToDouble() / denominator;
  }
}

extension ExtensionNum on num {
  double roundToFractions(int fractions) {
    final num denominator = pow(10.0, fractions);
    return (this * denominator).roundToDouble() / denominator;
  }
}
