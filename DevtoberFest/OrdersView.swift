// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import FioriSwiftUICore
import SwiftUI

struct OrdersView: View {
    @Binding var path: NavigationPath
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    var body: some View {
        ScrollView(.vertical) {
            MasonryLayout(numOfColumns: horizontalSizeClass == .compact ? 1 : 2, spacing: 16, lineSpacing: 16) {
                ForEach(Order.allOrders) { order in
                    ObjectHeader {
                        Text(order.title)
                    } subtitle: {
                        Text(order.subtitle)
                    } bodyText: {
                        HStack {
                            ForEach(order.tags) { tag in
                                TagView(tag: tag)
                                    .labelStyle(TagStyle())
                            }
                        }
                    } footnote: {
                        if let desc = order.description {
                            Text(desc).lineLimit(1)
                        }
                    } status: {
                        TagView(tag: order.status)
                            .labelStyle(ColorStyle(color: order.isDelivered ? .preferredColor(.neutralLabel) : .preferredColor(.blue8)))
                    } substatus: {
                        TagView(tag: order.substatus)
                            .labelStyle(ColorStyle(color: order.isDelivered ? .preferredColor(.positiveLabel) : .preferredColor(.customColor5)))
                    } detailImage: {
                        Image(order.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .environment(\.horizontalSizeClass, .compact)
                    .onTapGesture(count: 1) {
                        path.append(order)
                    }
                    
                    Divider()
                }
            }.padding()
        }
        .navigationBarTitle("Your Orders", displayMode: .inline)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                FioriButton { _ in
                    Image(fioriName: "fiori.search")
                        .font(.fiori(forTextStyle: .body))
                }
                .fioriButtonStyle(FioriTertiaryButtonStyle())
                .frame(width: 38, height: 44)
                
                FioriButton { _ in
                    Image(fioriName: "fiori.menu2")
                        .font(.fiori(forTextStyle: .body))
                }
                .fioriButtonStyle(FioriTertiaryButtonStyle())
                .frame(width: 38, height: 44)
            }
        }
    }
}

#Preview("Portait") {
    OrdersView(path: .constant(NavigationPath()))
}

#Preview("Landscape", traits: .landscapeRight) {
    OrdersView(path: .constant(NavigationPath()))
        .environment(\.horizontalSizeClass, .regular)
}
