import 'dart:io';

Future<(List<int> left, List<int> right)> readInput() async {
  final filePath = 'input.txt';

  List<int> left = [];
  List<int> right = [];

  try {
    final file = File(filePath);
    List<String> lines = await file.readAsLines();

    for (String line in lines) {
      List<String> parts = line.split(RegExp(r'\s+'));

      if (parts.length == 2) {
        left.add(int.parse(parts[0]));
        right.add(int.parse(parts[1]));
      }
    }
  } catch (e) {
    print('Error reading or processing the file: $e');
  }
  return (left, right);
}

void main() async {
  List<int> left = [];
  List<int> right = [];
  (left, right) = await readInput();
  left.sort();
  right.sort();
  // int sum = sum_of_loc_diff(left, right);
  int sum = sum_of_similarities(left, right);
  print(sum);
}

int sum_of_loc_diff(List<int> l, List<int> r) {
  int sum = 0;

  for (int i = 0; i < l.length; i++) {
    if (l[i] > r[i]) {
      sum += l[i] - r[i];
    } else {
      sum += r[i] - l[i];
    }
  }
  return sum;
}

int sum_of_similarities(List<int> l, List<int> r) {
  int sum = 0;

  for (int i = 0; i < l.length; i++) {
    int frequency = 0;
    for (int j = 0; j < r.length; j++) {
      if (l[i] == r[j]) {
        frequency += 1;
      }
    }
    sum += frequency * l[i];
  }
  return sum;
}
