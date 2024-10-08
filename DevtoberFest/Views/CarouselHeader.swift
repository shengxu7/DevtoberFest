// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import FioriSwiftUICore
import SwiftUI

struct CarouselHeader: View {
    let title: String
    let count: Int
    let linkValue: Int
    
    var body: some View {
        HStack {
            Text(title)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
            Spacer()
            
            NavigationLink(value: linkValue) {
                HStack(spacing: 0) {
                    Text("See All (\(count))")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.tintColor))
                    Image(fioriName: "fiori.slim.arrow.right")
                        .foregroundStyle(Color.preferredColor(.separator))
                }
            }
        }
    }
}

#Preview {
    CarouselHeader(title: "Your Orders", count: Order.allOrders.count, linkValue: 0)
}
