// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import FioriSwiftUICore
import SwiftUI

struct TagView: View {
    let tag: TagInfo?
    
    var body: some View {
        if let tag = tag {
//            HStack(spacing: 0) {
//                if let image = tag.image {
//                    Image(fioriName: image)
//                }
//                
//                Text(tag.name).lineLimit(1)
//            }
            Label {
                Text(tag.name).lineLimit(1)
            } icon: {
                if let image = tag.image {
                    Image(fioriName: image)
                }
            }

        } else {
            EmptyView()
        }
    }
}

struct ColorStyle: LabelStyle {
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            configuration.icon
            configuration.title
        }
        .font(.fiori(forTextStyle: .footnote))
        .foregroundStyle(color)
    }
}

struct TagStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            configuration.icon
            configuration.title
        }
        .font(.fiori(forTextStyle: .footnote))
        .foregroundStyle(Color.preferredColor(.accentLabel8))
        .padding(4)
        .background(Color.preferredColor(.accentBackground8))
        .cornerRadius(8)
    }
}


#Preview {
    TagView(tag: TagInfo(name: "New order", image: "fiori.hint"))
        .labelStyle(ColorStyle(color: .preferredColor(.accentLabel8)))
//        .font(.fiori(forTextStyle: .footnote))
//        .foregroundStyle(Color.preferredColor(.accentLabel8))
//        .padding(4)
//        .background(Color.preferredColor(.accentBackground8))
//        .cornerRadius(8)
}

#Preview {
    TagView(tag: TagInfo(name: "New order", image: "fiori.hint"))
        .labelStyle(TagStyle())
}
