import 'dart:io';

Future<List<List<int>>> readInput() async {
  final filePath = 'input.txt';

  List<List<int>> rows = [];

  try {
    final file = File(filePath);
    List<String> lines = await file.readAsLines();

    for (String line in lines) {
      List<String> parts = line.split(RegExp(r'\s+'));

      List<int> row = parts.map(int.parse).toList();
      rows.add(row);
    }
    int total = 0;
    for (int i = 0; i < rows.length; i++) {
      List<int> row = rows[i];

      bool isValid = totalSafeReports(row);
      if (isValid) {
        total += 1;
      }
     
    }
     print('Total safe levels: ${total}');
  } catch (e) {
    print('Error reading or processing the file: $e');
  }
  return rows;
}

void main() async {
  await readInput();
}

bool totalSafeReports(List<int> level) {
  int first = level.first;
  int diff = 0;
  List<int> differences = [];
  for (int i = 0; i < level.length - 1; i++) {
    diff = level[i + 1] - first;
    differences.add(diff);
    first = level[i + 1];
  }

  return increaseOrDecreaseBy(differences);
}

increaseOrDecreaseBy(List diff) {
  if (diff.contains(0)) return false;
  if (diff.any((element) => element < -3 || element > 3)) return false;
  bool hasPositive = diff.any((element) => element > 0);
  bool hasNegative = diff.any((element) => element < 0);
  if (hasPositive && hasNegative) return false;
  return true;
}
