package main

import (
	"fmt"
	"sort"
)

func main() {
	left := []int{3, 4, 2, 1, 3, 3}
	right := []int{4, 3, 5, 3, 9, 3}
	sort.Ints(left)
	sort.Ints(right)
	sum := SumOfLocDiff(left, right)
	sum2 := sum_of_similarities(left, right)
	fmt.Println(sum)
	fmt.Println(sum2)

}

func SumOfLocDiff(left []int, right []int) int {
	sum := 0

	for i := 0; i < len(left); i++ {
		if left[i] > right[i] {
			sum += left[i] - right[i]
		} else {
			sum += right[i] - left[i]
		}
	}
	return sum
}

func sum_of_similarities(left []int, right []int) int {
	sum := 0
	for i := 0; i < len(left); i++ {
		frequency := 0
		for j := 0; j < len(right); j++ {
			if left[i] == right[j] {
				frequency += 1
			}
		}
		sum += frequency * left[i]

	}
	return sum

}
