// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import FioriSwiftUICore
import SwiftUI

struct StepItemData: StepItem, Identifiable, Equatable {
    
    var id: String = UUID().uuidString
    /// Step title.
    var title: String?
    /// Step state.
    var state: StepProgressIndicatorState = .normal
    /// Sub-steps for this one.
    var substeps: [StepItem] = []
    
    init(id: String = UUID().uuidString,
         title: String? = nil,
         state: StepProgressIndicatorState = [],
         substeps: [StepItemData] = [])
    {
        self.id = id
        self.title = title
        self.state = state
        self.substeps = substeps
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
