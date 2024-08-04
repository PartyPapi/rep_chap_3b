double calculateAveragePrice(List<double> prices) {
  double total = 0;
  for (double price in prices) {
    total += price;
  }
  double average = total / prices.length;

  return average;
}

void main() {
  List<double> prices = [19.99, 29.99, 9.99, 49.99];
  double average = calculateAveragePrice(prices);
  print(
      "Der Durchschnitt in der Liste ist \$${average.toStringAsFixed(2)}.");
}
