// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import FioriSwiftUICore
import SwiftUI

struct HomeView: View {
    @State private var searchString: String = ""
    @State private var selectedTab: Int = 1
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 10) {
                    CarouselHeader(title: "Your Orders", count: Order.allOrders.count, linkValue: 0)
                    Carousel(numberOfColumns: 1) {
                        ForEach(Order.allOrders) { order in
                            Card {
                                Text(order.title)
                            } subtitle: {
                                Text(order.subtitle)
                            } detailImage: {
                                Image(order.image)
                                    .resizable()
                                    .cornerRadius(16)
                            } row1: {
                                HStack {
                                    TagView(tag: order.status)
                                        .labelStyle(ColorStyle(color: order.isDelivered ? .preferredColor(.neutralLabel) : .preferredColor(.blue8)))
                                    TagView(tag: order.substatus)
                                        .labelStyle(ColorStyle(color: order.isDelivered ? .preferredColor(.positiveLabel) : .preferredColor(.customColor5)))
                                }
                            } row2: {
                                if let delivery = order.delivery {
                                    Text(delivery)
                                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                                        .font(.fiori(forTextStyle: .footnote))
                                }
                            } cardBody: {
                                if let stepData = order.orderProgress {
                                    StepProgressIndicatorView(steps: stepData)
                                }
                            }
                            .onTapGesture(count: 2) {
                                path.append(order)
                            }
                        }
                    }
                    
                    Spacer().frame(height: 32)
                    
                    CarouselHeader(title: "Top Picks", count: Product.allProducts.count, linkValue: 1)
                    Carousel(numberOfColumns: 1) {
                        ForEach(Product.allProducts) { product in
                            Card {
                                Image(product.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 145)
                            } title: {
                                Text(product.title)
                            } subtitle: {
                                let price = String(format: "$%.2f USD", product.price)
                                Text(price)
                            } row1: {
                                RatingControl(rating: .constant(product.rating), ratingControlStyle: .standard)
                            }
                            .onTapGesture(count: 2) {
                                path.append(product)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationDestination(for: Int.self) { index in
                if index == 0 { /// Orders
                    OrdersView(path: $path)
                } else if index == 1 {
                    ProductsView(path: $path)
                }
            }
            .navigationDestination(for: Order.self) { order in
                OrderDetailView(order)
            }
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product)
            }
            .cardStyle(.card)
            .navigationTitle(Text("Home"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Image("SAPLogo")
                        .resizable()
                        .frame(width: 48, height: 24)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    FioriButton { _ in
                        Image(fioriName: "fiori.menu2")
                            .font(.fiori(forTextStyle: .body))
                    }
                    .fioriButtonStyle(FioriTertiaryButtonStyle())
                    .frame(width: 38, height: 44)
                }
            })
            .searchable(text: $searchString, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search or ask a question")
        }
    }
}

#Preview("Home") {
    HomeView()
}
