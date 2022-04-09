//
//  fnb.swift
//  AFL 2 Probo Krishnacahya
//
//  Created by MacBook Pro on 07/04/22.
//

import Foundation

public class FNB {
    private var name: String = ""
    private var quantity: Int = 0
    
    init(name: String = "", quantity: Int = 0) {
        self.name = name
        self.quantity = quantity
    }
    
    var nameGetSet: String {
        get {
            return name
        }
        set(setter) {
            name = setter
        }
    }
    
    var quantityGetSet: Int {
        get {
            return quantity
        }
        set(setter) {
            quantity = setter
        }
    }
}
