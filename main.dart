void main() {
  List<int> left = [3, 4, 2, 1, 3, 3];
  List<int> right = [4, 3, 5, 3, 9, 3];
  int sum = sum_of_loc_diff(left, right);
  print(sum);
}

int sum_of_loc_diff(List<int> l, List<int> r) {
  int sum = 0;
  l.sort();
  r.sort();

  for (int i = 0; i < l.length; i++) {
    if (l[i] > r[i]) {
      sum += l[i] - r[i];
    } else {
      sum += r[i] - l[i];
    }
  }
  return sum;
}
