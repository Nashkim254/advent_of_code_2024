fn main() {
    let mut left: Vec<i32> = vec![3, 4, 2, 1, 3, 3]; // Make left mutable
    let mut right: Vec<i32> = vec![4, 3, 5, 3, 9, 3]; // Make right mutable

    left.sort();
    right.sort();

    let sum = sum_of_loc_diff(&left, &right); // Pass slices or references
    let sum2 = sum_of_similarities(&left, &right); // Pass slices or references
    println!("Sum of location differences: {}", sum);
    println!("Sum of location similarities: {}", sum2);
}

fn sum_of_loc_diff(l: &[i32], r: &[i32]) -> i32 {
    let mut sum = 0;
    for i in 0..l.len() {
        sum += (l[i] - r[i]).abs(); // Use absolute difference
    }
    sum
}

fn sum_of_similarities(l: &[i32], r: &[i32]) -> i32 {
    let mut sum = 0;
    for i in 0..l.len() {
        let mut frequency = 0;
        for j in 0..r.len() {
            if l[i] == r[j]{
                frequency += 1;
            }
        }
        sum += frequency * l[i];
    }
    sum
}
