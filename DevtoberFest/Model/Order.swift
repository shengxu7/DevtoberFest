// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import Foundation

struct TagInfo: Identifiable, Hashable {
    let id = UUID()
    
    let name: String
    let image: String?
    
    init(name: String, image: String? = nil) {
        self.name = name
        self.image = image
    }
}

struct Order: Identifiable, Hashable {
    let id = UUID().uuidString
    
    let title: String
    let subtitle: String
    let image: String
    let status: TagInfo?
    let substatus: TagInfo?
    let delivery: String?
    let description: String?
    let tags: [TagInfo]
    let orderProgress: [StepItemData]?
    
    var isDelivered: Bool {
        if let progress = orderProgress {
            if progress.last?.state == .completed {
                return true
            }
        }
        
        return false
    }
    
    init(title: String, subtitle: String, image: String, status: TagInfo? = nil, substatus: TagInfo? = nil, delivery: String? = nil, description: String? = nil, tags: [TagInfo], orderProgress: [StepItemData]? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.status = status
        self.substatus = substatus
        self.delivery = delivery
        self.description = description
        self.tags = tags
        self.orderProgress = orderProgress
    }
    
    func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }
}

extension Order {
    static let progress1 = [StepItemData(title: "Invoice approved", state: .completed),
                        StepItemData(title: "Received by UPS", state: .normal),
                        StepItemData(title: "Order out for delivery"),
                        StepItemData(title: "Delivered")]
    static let progress2 = [StepItemData(title: "Invoice approved", state: .completed),
                         StepItemData(title: "Received by UPS", state: .completed),
                        StepItemData(title: "Order out for delivery"),
                        StepItemData(title: "Delivered")]
    static let progress3 = [StepItemData(title: "Invoice approved", state: .completed),
                         StepItemData(title: "Received by UPS", state: .completed),
                         StepItemData(title: "Order out for delivery", state: .completed),
                         StepItemData(title: "Delivered", state: .completed)]
    
    static let order1 = Order(title: "Multi-functional ergonomic chair", subtitle: "PR5099", image: "Chair", status: TagInfo(name: "New order", image: "fiori.hint"), substatus: TagInfo(name: "Preparing to ship", image: "fiori.shipping.status"), delivery: "Expected delivery Oct 10, 2024", description: "Experience unparalleled comfort and support with our ergonomic chair. Designed to promote good posture and reduce strain on your body, this chair is perfect for long hours of work or study. The adjustable features allow you to customize the chair to your liking, ensuring a perfect fit for your unique needs. Upgrade your seating experience today with our ergonomic chair.", tags: [TagInfo(name: "Approved")], orderProgress: progress1)
    
    static let order2 = Order(title: "ComfortPro Desk", subtitle: "PR6888", image: "Desk", status: TagInfo(name: "New order", image: "fiori.hint"), substatus: nil, delivery: "Expected delivery Oct 10, 2024", description: nil, tags: [TagInfo(name: "Approved")], orderProgress: progress2)
    
    static let order3 = Order(title: "ErgoBliss Keyboard", subtitle: "PR5262", image: "Keyboard", status: TagInfo(name: "Past order"), substatus: TagInfo(name: "Delivered", image: "fiori.product"), delivery: "Expected delivery Oct 10, 2024", description: "Experience enhanced typing support", tags: [TagInfo(name: "Approved")], orderProgress: progress3)
    
    static let order4 = Order(title: "ErgoBliss Mouse", subtitle: "PR5200", image: "Mouse", status: TagInfo(name: "Past order"), substatus: TagInfo(name: "Delivered", image: "fiori.product"), delivery: "Expected delivery Oct 10, 2024", description: "Experience unparalleled comfort and support with our ergonomic chair. Designed to promote good posture and reduce strain on your body, this chair is perfect for long hours of work or study.", tags: [TagInfo(name: "Approved")], orderProgress: progress3)
    
    static let order5 = Order(title: "Wide-curved 5k Monitor", subtitle: "PR5099", image: "Monitor", status: TagInfo(name: "Past order"), substatus: TagInfo(name: "Delivered", image: "fiori.product"), delivery: "Expected delivery Oct 10, 2024", description: "Experience unparalleled comfort and support with our ergonomic chair. Designed to promote good posture and reduce strain on your body, this chair is perfect for long hours of work or study.", tags: [TagInfo(name: "Approved")], orderProgress: progress3)
    
    static let order6 = Order(title: "ComfortPro Desk", subtitle: "PR4088", image: "Desk", status: TagInfo(name: "Past order"), substatus: TagInfo(name: "Delivered", image: "fiori.product"), delivery: "Expected delivery Oct 10, 2024", description: "Experience unparalleled comfort and support with our ergonomic chair. Designed to promote good posture and reduce strain on your body, this chair is perfect for long hours of work or study.", tags: [TagInfo(name: "Approved")], orderProgress: progress3)
    
    static let allOrders = [order1, order2, order3, order4, order5, order6]
}
