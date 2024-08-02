int findMaxValue(List<int> numbers) {
  if (numbers.isEmpty) {
    throw ArgumentError('Die Liste darf nicht leer sein');
  }
  int maxValue = numbers[0];
  for (int number in numbers) {
    if (number > maxValue) {
      maxValue = number;
    }
  }
  return maxValue;
}

void main() {
  List<int> list1 = [3, 5, 7, 2, 8];
  List<int> list2 = [10, 20, 5, 25, 15];
  int max1 = findMaxValue(list1);
  int max2 = findMaxValue(list2);
  print("Der größte Wert in der Liste 1 ist $max1.");
  print("Der größte Wert in der Liste 2 ist $max2.");
}
