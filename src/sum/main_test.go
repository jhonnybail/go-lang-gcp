package main

import "testing"

func TestSum(test *testing.T) {
	result := sum(5, 5)
	shouldBe := 10

	if result != shouldBe {
		test.Errorf("Função sum deveria retornar 10, mas retornou %v", result);
	}
}