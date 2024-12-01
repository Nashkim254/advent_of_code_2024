package main

import (
	"fmt"
	"sort"
)

func main() {
	left := []int{3, 4, 2, 1, 3, 3}
	right := []int{4, 3, 5, 3, 9, 3}
	sum := SumOfLocDiff(left, right)
	fmt.Println(sum)

}

func SumOfLocDiff(left []int, right []int) int {
	sum := 0
	sort.Ints(left)
	sort.Ints(right)
	for i := 0; i < len(left); i++ {
		if left[i] > right[i] {
			sum += left[i] - right[i]
		} else {
			sum += right[i] - left[i]
		}
	}
	return sum
}
