//
//  ViewController.swift
//  Deep-Link-Demo
//
//  Created by ✪ Lê Vấn ✪ on 5/21/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    let products: [Product] = [
        Product(id: 1, name: "iPhone", price: 600, urlImage: "https://cdn.tgdd.vn/Products/Images/42/92962/iphone-6-32gb-vang-400-400x460.png"),
        Product(id: 2, name: "iPad", price: 700, urlImage: "https://cdn.tgdd.vn/Products/Images/522/102787/ipad-wifi-32gb-2017-400-1-400x460.png"),
        Product(id: 3, name: "Macbook", price: 800, urlImage: "https://cdn.tgdd.vn/Products/Images/44/71281/apple-macbook-pro-2015-mf839zp-a-i5-5257u-8gb-128g-450x300-450x300.png")
    ]
    
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
    }
}

extension ProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductCellTableViewCell
        cell.initCell(product: products[indexPath.row])
        return cell
    }
}

extension ProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.product = products[indexPath.row]

        navigationController?.pushViewController(vc, animated: true)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}








