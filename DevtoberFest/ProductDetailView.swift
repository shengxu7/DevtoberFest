// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import FioriSwiftUICore
import SwiftUI

struct ProductDetailView: View {
    let product: Product
    init(_ product: Product) {
        self.product = product
    }
    
    var body: some View {
        List {
            Card {
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 145)
            } title: {
                Text(product.title)
            } subtitle: {
                Text("$\(product.price) USD")
            } row1: {
                RatingControl(rating: .constant(product.rating), ratingControlStyle: .standard)
            } row2: {
                HStack {
                    ForEach(product.tags) { tag in
                        TagView(tag: tag)
                            .font(.fiori(forTextStyle: .footnote))
                            .foregroundStyle(Color.preferredColor(.accentLabel8))
                            .padding(4)
                            .background(Color.preferredColor(.accentBackground8))
                            .cornerRadius(8)
                    }
                }
            } row3: {
                if let desc = product.description {
                    Text(desc)
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                }
            } action: {
                FioriButton(title: "Order")
            } secondaryAction: {
                FioriButton(title: "Save for Later")
            }
        }
    }
}

#Preview("Product 1") {
    ProductDetailView(Product.product1)
}
