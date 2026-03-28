package main

import "fmt"

func main() {
	vlans := map[string]int{
		"MGMT":    10,
		"FINANCE": 20,
		"MARKET":  30,
		"IT":      40,
		"RND":     50,
		"GUEST":   60,
	}

	fmt.Println("=== NETWORK SEGMENTATION ===")
	for dept, id := range vlans {
		fmt.Printf("%s -> VLAN %d\n", dept, id)
	}
}