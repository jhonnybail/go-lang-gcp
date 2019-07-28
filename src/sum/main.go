package main
import "fmt"

func sum(a int, b int) int {
    return a + b
}

func main() {
    result := sum(5, 5)
    fmt.Println("O resultado de 5 + 5 é", result)
}
