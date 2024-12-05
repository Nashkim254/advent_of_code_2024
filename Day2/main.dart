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
   int total = countSafeReportsWithDampener(rows);
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

  return withOneException(differences);
}

increaseOrDecreaseBy(List diff) {
  if (diff.contains(0)) return false;
  if (diff.any((element) => element < -3 || element > 3)) return false;
  bool hasPositive = diff.any((element) => element > 0);
  bool hasNegative = diff.any((element) => element < 0);
  if (hasPositive && hasNegative) return false;
  return true;
}

withOneException(List diff) {
  int count = 0;
  if (diff.contains(0)) {
    count += 1;
    print("first check: $count");
  }
  if (diff.any((element) => element < -3)) {
    count += 1;
    print("second check: $count");
  }
  if (diff.any((element) => element > 3)) {
    count += 1;
    print("third check: $count");
  }
  bool hasPositive = diff.any((element) => element > 0);
  bool hasNegative = diff.any((element) => element < 0);
  if (hasPositive && hasNegative) {
    count += 1;
    print("fourth check: $count");
  }
  if (count == 1) {
    print("final count: $count");
    return false;
  }

  return true;
}

bool isSafeReport(List<int> report) {
  if (report.length < 2) return false;

  // Determine if the report is increasing or decreasing
  bool isIncreasing = report[1] > report[0];
  bool isConsistentDirection = true;

  for (int i = 0; i < report.length - 1; i++) {
    int diff = (report[i + 1] - report[i]).abs();

    // Check if the difference is within the range [1, 3]
    if (diff < 1 || diff > 3) {
      return false;
    }

    // Check for consistent direction
    if ((report[i + 1] > report[i]) != isIncreasing) {
      isConsistentDirection = false;
    }
  }

  return isConsistentDirection;
}

bool canBeSafeWithDampener(List<int> report) {
  // Try removing each level and check if the modified report is safe
  for (int i = 0; i < report.length; i++) {
    List<int> modifiedReport = [
      ...report.sublist(0, i),
      ...report.sublist(i + 1)
    ];
    if (isSafeReport(modifiedReport)) {
      return true;
    }
  }
  return false;
}

int countSafeReportsWithDampener(List<List<int>> reports) {
  int safeCount = 0;

  for (var report in reports) {
    if (isSafeReport(report) || canBeSafeWithDampener(report)) {
      safeCount++;
    }
  }

  return safeCount;
}