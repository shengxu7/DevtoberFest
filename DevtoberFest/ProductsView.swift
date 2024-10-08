// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import FioriSwiftUICore
import SwiftUI

struct ProductsView: View {
    @Binding var path: NavigationPath
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    var body: some View {
        ScrollView(.vertical) {
            MasonryLayout(numOfColumns: horizontalSizeClass == .compact ? 1 : 2) {
                ForEach(Product.allProducts) { product in
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
                    }
                    .onTapGesture(count: 1) {
                        path.append(product)
                    }
                }
            }
            .padding()
        }
        .cardStyle(.card)
        .navigationBarTitle("Your Products", displayMode: .inline)
    }
}

#Preview {
    ProductsView(path: .constant(NavigationPath()))
}
