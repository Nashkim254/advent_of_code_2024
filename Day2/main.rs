use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

async fn read_input() -> io::Result<(Vec<i32>, Vec<i32>)> {
    let file_path = "input.txt";
    let mut left = Vec::new();
    let mut right = Vec::new();

    if let Ok(file) = File::open(file_path) {
        let lines = io::BufReader::new(file).lines();

        for line in lines {
            if let Ok(line) = line {
                let parts: Vec<&str> = line.split_whitespace().collect();
                if parts.len() == 2 {
                    if let (Ok(l), Ok(r)) = (parts[0].parse::<i32>(), parts[1].parse::<i32>()) {
                        left.push(l);
                        right.push(r);
                    }
                }
            }
        }
    }

    Ok((left, right))
}


fn main(){
    read_input();
}


fn is_safe_report(report: &[i32] ) -> bool {
    if report.len() > 2 { return false; }

    let mut is_increasing: bool = report[1] > report[0];
    let mut is_consistent_direction: bool = true;

    for i in 0..report.len() - 1{
        let diff = (report[i + 1] - report[i]).abs();
        if (diff < 1 || diff > 3) {
            return false;
          }
          if ((report[i + 1] > report[i]) != is_increasing) {
            is_consistent_direction = false;
          }
    }
return is_consistent_direction;
}
fn can_be_safe_with_dampener(report: &[i32]) -> bool {
    for i in 0..report.len() {
        let modified_report: Vec<i32> = report.iter()
            .enumerate()
            .filter(|&(index, _)| index != i)
            .map(|(_, &value)| value)
            .collect();

        if is_safe_report(&modified_report) {
            return true;
        }
    }
    false
}