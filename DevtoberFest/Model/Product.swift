// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID().uuidString
    
    let title: String
    let subtitle: String
    let image: String
    let price: Float
    let rating: Int
    let description: String?
    let tags: [TagInfo]
}

extension Product {
    static let product1 = Product(title: "Wireless Headset A123", subtitle: "PR5099", image: "headphones", price: 120.00, rating: 4, description: "Experience unparalleled comfort and support with our ergonomic chair.", tags: [TagInfo(name: "Tag1", image: "fiori.hint"), TagInfo(name: "Tag2", image: "fiori.shipping.status")])
    
    static let product2 = Product(title: "Multi-functional ergonomic chair", subtitle: "PR5099", image: "Chair", price: 120.00, rating: 4, description: "Experience unparalleled comfort and support with our ergonomic chair. Designed to promote good posture and reduce strain on your body, this chair is perfect for long hours of work or study. The adjustable features allow you to customize the chair to your liking, ensuring a perfect fit for your unique needs. Upgrade your seating experience today with our ergonomic chair.", tags: [TagInfo(name: "Tag1", image: "fiori.hint"), TagInfo(name: "Tag2", image: "fiori.shipping.status")])
    
    static let product3 = Product(title: "ComfortPro Desk", subtitle: "PR6088", image: "Desk", price: 399.99, rating: 4, description: "Experience unparalleled comfort and support with our ergonomic chair. Designed to promote good posture and reduce strain on your body, this chair is perfect for long hours of work or study. The adjustable features allow you to customize the chair to your liking, ensuring a perfect fit for your unique needs. Upgrade your seating experience today with our ergonomic chair.", tags: [TagInfo(name: "Tag1", image: "fiori.hint"), TagInfo(name: "Tag2", image: "fiori.shipping.status")])
    
    static let product4 = Product(title: "ErgoBliss Keyboard", subtitle: "PR5262", image: "Keyboard", price: 49.99, rating: 4, description: "Experience unparalleled comfort and support with our ergonomic chair. Designed to promote good posture and reduce strain on your body, this chair is perfect for long hours of work or study. The adjustable features allow you to customize the chair to your liking, ensuring a perfect fit for your unique needs. Upgrade your seating experience today with our ergonomic chair.", tags: [TagInfo(name: "Tag1", image: "fiori.hint"), TagInfo(name: "Tag2", image: "fiori.shipping.status")])
    
    static let product5 = Product(title: "ErgoBliss Mouse", subtitle: "PR5200", image: "Mouse", price: 19.99, rating: 5, description: "Experience unparalleled comfort and support with our ergonomic chair. Designed to promote good posture and reduce strain on your body, this chair is perfect for long hours of work or study. The adjustable features allow you to customize the chair to your liking, ensuring a perfect fit for your unique needs. Upgrade your seating experience today with our ergonomic chair.", tags: [TagInfo(name: "Tag1", image: "fiori.hint"), TagInfo(name: "Tag2", image: "fiori.shipping.status")])
    
    static let product6 = Product(title: "Wide-curved 5k Monitor", subtitle: "PR5000", image: "Monitor", price: 299.99, rating: 4, description: "Experience unparalleled comfort and support with our ergonomic chair. Designed to promote good posture and reduce strain on your body, this chair is perfect for long hours of work or study. The adjustable features allow you to customize the chair to your liking, ensuring a perfect fit for your unique needs. Upgrade your seating experience today with our ergonomic chair.", tags: [TagInfo(name: "Tag1", image: "fiori.hint"), TagInfo(name: "Tag2", image: "fiori.shipping.status")])
    
    static let allProducts = [product1, product2, product3, product4, product5, product6]
}
