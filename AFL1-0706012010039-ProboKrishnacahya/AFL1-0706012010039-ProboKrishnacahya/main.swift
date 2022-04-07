//
//  main.swift
//  AFL1-0706012010039-ProboKrishnacahya
//
//  Created by MacBook Pro on 18/03/22.
//

import Foundation

// Welcome Page Point of Sales
print("==========================")
print("   Point of Sales (PoS)   ")
print("==========================")

// Struct untuk Menu [1]
struct ProductModel {
    let id: String
    let name: String
    let price: Int
}

// Struct untuk Menu [2]
struct ShoppingCartModel {
    var item: ProductModel
    var qty: Int
    var price: Int
}

// Constant untuk opsi (nama) Main Menu
let mainMenu = ["Buy Food", "Shopping Cart", "Exit"]

// Constant untuk F&B
let product = [
    ProductModel(id: "F03", name: "Gado-Gado", price: 15000),
    ProductModel(id: "F02", name: "Chicken Satay", price: 2000),
    ProductModel(id: "F01", name: "Nasi Padang", price: 20000),
    ProductModel(id: "B02", name: "Mineral Water", price: 4000),
    ProductModel(id: "B01", name: "Ice Tea", price: 7000)
]

// Variable untuk menyimpan F&B yang masuk ke Shopping Cart
var shopping = [ShoppingCartModel]()

// Menampilkan 3 Opsi Main Menu [1], [2], [x]
func showMainMenu() {
    print("\nOptions:")
    for index in 0..<mainMenu.count {
        // Jika Input Opsi >2, maka tidak akan masuk ke Menu.
        print(index + 1 != 3 ? "[\(index + 1)] \(mainMenu[index])" : "[x] \(mainMenu[index])")
    }
}

// Menerima (membaca) Input User untuk Main Menu
func showMainMenuInput() {
    print("\nYour Choice? ")
    if let response = readLine() {
        selectOption(menu: response)
    } else {
        print("\nInput Not Found. Please Try Again.")
    }
}

// Melanjutkan sesuai opsi Main Menu yang dipilih User
func selectOption(menu: String) {
    if menu == "2" || menu == "Shopping Cart".lowercased() {
        // Jika Shopping Cart masih kosong
        if shopping.isEmpty {
            print("Your shopping cart is empty. Please buy something!")
            startProgram()
            // Jika Shopping Cart telah terisi daftar keinginan
        } else {
            showShoppingCart()
            showUpdateOrDeleteInput()
        }
    } else if menu  == "1" || menu == "Buy Food".lowercased() {
        // Tampilkan daftar produk 5 F&B dan terima inputnya
        showProduct()
        showProductInput()
    } else {
        print("Thank You for using our application, have a nice day :)")
    }
}

// Menampilkan Daftar F&B berdasarkan Kode serta Nama F&B nya jika User memilih Menu [1]
func showProduct() {
    print("\nHi, We have 5 Food & Beverage options for You!")
    print("----------------------------------------------")
    for item in product {
        print("[\(item.id)] \(item.name) Rp\(item.price)")
    }
    print("[Q] Back to Main Menu")
    print("[C] Go to Cart")
}

// Menampilkan isi Shopping Cart
func showShoppingCart() {
    print("\nShopping Cart (\(shopping.count) items):")
    for cart in shopping {
        print("\(cart.item.id) - @\(cart.qty) - \(cart.item.name)")
    }
    let totalPrice = shopping.map{$0.price}.reduce(0, +)
    print("Total Price: Rp\(totalPrice)")
}

// Tampilkan respon Input User
func showProductInput() {
    print("\nYour F&B Choice? ")
    if let response = readLine() {
        selectProduct(item: response.lowercased())
    } else {
        print("\nInput Not Found. Please Try Again.")
    }
}

func selectProduct(item: String) {
    if item == "Q".lowercased() {
        startProgram()
    } else if item == "C".lowercased() {
        if shopping.isEmpty {
            print("Your shopping cart is empty. Please buy something!!!")
            showProduct()
            showProductInput()
        } else {
            showShoppingCart()
            showUpdateOrDeleteInput()
        }
    } else {
        let productItem = product.first { data in
            data.id.lowercased() == item || data.name.lowercased() == item
        }
        showQtyInput(product: productItem)
    }
}

// Tampilkan banyaknya porsi daftar keinginan
func showQtyInput(product: ProductModel?) {
    if let item = product {
        print("\nHow many '\(item.name)' You want to buy?")
        if let response = readLine() {
            updateCart(product: item, qty: response)
        } else {
            print("\nInput Not Found. Please Try Again")
        }
    } else {
        print("Product unknown.")
    }
}

// Tambahkan daftar keinginan ke Shopping Cart setelah user menentukan F&B serta banyaknya porsi
func updateCart(product: ProductModel, qty: String) {
    shopping.append(ShoppingCartModel(item: product, qty: Int(qty) ?? 0, price: product.price * (Int(qty) ?? 0)))
    
    showShoppingCart()
    showProduct()
    showProductInput()
}

// Pilihan action Update / Delete isi Shopping Cart
func showUpdateOrDeleteInput() {
    print("Want to Update or Delete Item in Shopping Cart?")
    print("[0] Cancel")
    print("[1] Update")
    print("[2] Delete")
    
    if let response = readLine() {
        if response.lowercased() == "1" {
            showEditInput()
        } else if response.lowercased() == "2" {
            showDeleteInput()
        } else {
            startProgram()
        }
    } else {
        print("Input unknown.")
    }
}

// Memilih item F&B yang ingin diubah dari Shopping Cart
func showEditInput() {
    print("Type item's ID for Update Shopping Cart:")
    if let id = readLine() {
        let productItem = shopping.first { data in
            data.item.id == id
        }
        
        if let data = productItem {
            showEditQty(shoppingItem: data)
        }
    } else {
        print("Input unknown.")
    }
}

// Mengubah porsi item F&B di Shopping Cart
func showEditQty(shoppingItem: ShoppingCartModel) {
    print("Type amount Quantity of item:")
    if let qty = readLine() {
        let findIndex = shopping.firstIndex {$0.item.id == shoppingItem.item.id}
        
        if let index = findIndex {
            editItem(item: shoppingItem.item, index: index, qty: Int(qty) ?? 0)
        }
    } else {
        print("Input unknown.")
    }
}

// Perbarui hasil daftar keinginan terkini setelah melakukan Update Shopping Cart
func editItem(item: ProductModel, index: Int, qty: Int) {
    shopping[index].item = item
    shopping[index].price = item.price * qty
    shopping[index].qty = qty
    
    showShoppingCart()
    startProgram()
}

// Memilih item F&B yang ingin dihapus dari Shopping Cart
func showDeleteInput() {
    print("Type item's ID for Delete Shopping Cart:")
    if let response = readLine() {
        let productItem = shopping.first { data in
            data.item.id == response
        }
        
        if let data = productItem {
            deleteItem(item: data.item)
        }
    } else {
        print("Input unknown.")
    }
}

// Melakukan eksekusi penghapusan item F&B sesuai yang dipilih User
func deleteItem(item: ProductModel) {
    let findIndex = shopping.firstIndex {$0.item.id == item.id}
    
    if let index = findIndex {
        shopping.remove(at: index)
    }
    showShoppingCart()
    startProgram()
}

func startProgram() {
    showMainMenu()
    showMainMenuInput()
}

startProgram()
