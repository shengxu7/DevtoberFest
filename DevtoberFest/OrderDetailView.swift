// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import FioriSwiftUICore
import SwiftUI

struct OrderDetailView: View {
    let order: Order
    
    init(_ order: Order) {
        self.order = order
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 20) {
                Card {
                    Text(order.title)
                } subtitle: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(order.subtitle)
                        HStack {
                            ForEach(order.tags) { tag in
                                TagView(tag: tag)
                                    .labelStyle(TagStyle())
                            }
                        }
                    }
                } detailImage: {
                    Image(order.image).resizable().cornerRadius(16)
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
                            .font(.fiori(forTextStyle: .subheadline))
                    }
                } row3: {
                    if let desc = order.description {
                        Text(desc)
                            .font(.fiori(forTextStyle: .subheadline))
                            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                    }
                }
                .background(Color.preferredColor(.secondaryGroupedBackground))
                
                if let stepData = order.orderProgress {
                    StepProgressIndicatorView(steps: stepData, noHeader: false)
                        .padding(.horizontal, 16)
                        .background(Color.preferredColor(.secondaryGroupedBackground))
                }
                
                FioriButton(title: "Cancel")
                    .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .negative, maxWidth: .infinity))
                    .background(Color.preferredColor(.secondaryGroupedBackground))
                
                SignatureCaptureView(title: "Delivered Sign-off Signature",
                                     onSave: { uiImage in
                    /// save the image here
                })
                ._drawingViewMaxHeight(300)
                .background(Color.preferredColor(.secondaryGroupedBackground))
            }
            .background(Color.preferredColor(.primaryGroupedBackground))
        }
        .navigationBarTitle("Order", displayMode: .inline)
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

#Preview("Order1") {
    OrderDetailView(Order.order1)
}
