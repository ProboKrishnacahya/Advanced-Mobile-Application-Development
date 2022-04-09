//
//  wishlist.swift
//  AFL 2 Probo Krishnacahya
//
//  Created by MacBook Pro on 08/04/22.
//

import Foundation

public class Wishlist: FNB, Cart {
    private var shopping = [String: Int]()
    
    init(quantity: Int = 0, name: String = "") {
        super.init(name: name, quantity: quantity)
    }
    
    public func appendCart(Item: String, Portion: Int) {
        shopping[Item] = Portion
    }
    
    public func showCart() {
        if shopping.isEmpty {
            print("Your Shopping Cart is empty. Please buy something!")
        } else {
            if shopping.count == 1 {
                print("\nShopping Cart (\(shopping.count) item):")
                for (qty, product) in shopping {
                    print(product, qty)
                }
            } else {
                print("\nShopping Cart (\(shopping.count) items):")
                for (qty, product) in shopping {
                    print(product, qty)
                }
            }
        }
    }
}
