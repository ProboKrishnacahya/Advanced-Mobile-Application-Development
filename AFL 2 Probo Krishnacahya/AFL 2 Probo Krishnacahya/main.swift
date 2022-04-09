//
//  main.swift
//  AFL 2 Probo Krishnacahya
//
//  Created by MacBook Pro on 07/04/22.
//

import Foundation

let data = Wishlist()
var selected: Bool = true
while selected == true {
    func mainMenu() {
        print("\n==========================")
        print("   Point of Sales (PoS)   ")
        print("==========================")
        print("\nOptions")
        print("[1] Buy Food")
        print("[2] Shopping Cart")
        print("[X] Exit")
    }
    mainMenu()
    
    print("\nYour choice?")
    if let menu = readLine() {
        switch menu {
            case "1":
                print("\nHi, We have 5 Food & Beverage options for You!")
                print("----------------------------------------------")
                print("[F03] Gado-Gado")
                print("[F02] Chicken Satay")
                print("[F01] Nasi Padang")
                print("[B02] Mineral Water")
                print("[B01] Ice Tea")
                print("[Q] Back to Main Menu")
                
                print("\nYour F&B Choice?")
                let option = readLine() ?? ""
                let opt = option.uppercased()
                
                if opt == "F03" {
                    data.nameGetSet = "Gado-Gado"
                    print("\nHow many '\(data.nameGetSet)' You want to buy?")
                    
                    var quantity = Int(readLine() ?? "") ?? 0
                    data.quantityGetSet = quantity
                    
                    data.appendCart(Item: data.nameGetSet, Portion: data.quantityGetSet)
                    data.showCart()
                } else if opt == "F02" {
                    data.nameGetSet = "Chicken Satay"
                    print("\nHow many '\(data.nameGetSet)' You want to buy?")
                    
                    var quantity = Int(readLine() ?? "") ?? 0
                    data.quantityGetSet = quantity
                    
                    data.appendCart(Item: data.nameGetSet, Portion: data.quantityGetSet)
                    data.showCart()
                } else if opt == "F01" {
                    data.nameGetSet = "Nasi Padang"
                    print("\nHow many '\(data.nameGetSet)' You want to buy?")
                    
                    var quantity = Int(readLine() ?? "") ?? 0
                    data.quantityGetSet = quantity
                    
                    data.appendCart(Item: data.nameGetSet, Portion: data.quantityGetSet)
                    data.showCart()
                } else if opt == "B02" {
                    data.nameGetSet = "Mineral Water"
                    print("\nHow many '\(data.nameGetSet)' You want to buy?")
                    
                    var quantity = Int(readLine() ?? "") ?? 0
                    data.quantityGetSet = quantity
                    
                    data.appendCart(Item: data.nameGetSet, Portion: data.quantityGetSet)
                    data.showCart()
                } else if opt == "B01" {
                    data.nameGetSet = "Ice Tea"
                    print("\nHow many '\(data.nameGetSet)' You want to buy?")
                    
                    var quantity = Int(readLine() ?? "") ?? 0
                    data.quantityGetSet = quantity
                    
                    data.appendCart(Item: data.nameGetSet, Portion: data.quantityGetSet)
                    data.showCart()
                } else if opt == "Q" {
                    print("Main Menu")
                } else {
                    print("\nOops.. unknown input. Please try again.")
                }
                
            case "2":
                data.showCart()
                
            case "X", "x":
                selected = false
                print("\nThank You for using our application, have a nice day :)")
                
            default:
                print("\nSorry, that option is not available. Please try again.")
        }
    } else {
        print("\nSorry, that option is not available. Please try again.")
    }
}
