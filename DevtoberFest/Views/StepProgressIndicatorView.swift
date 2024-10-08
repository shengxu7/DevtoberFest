// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct StepProgressIndicatorView: View {
    let noHeader: Bool
    @State var title: String = ""
    @State var selection: String = ""
    @State var steps: [StepItemData]
    
    init(steps: [StepItemData], noHeader: Bool = true ) {
        self.noHeader = noHeader
        self._steps = .init(initialValue: steps)
    }
    
    var body: some View {
        if noHeader {
            StepProgressIndicator(selection: self.$selection,
                                  stepItems: self.steps)
        } else {
            StepProgressIndicator(selection: self.$selection,
                                  stepItems: self.steps) {
                Text(self.title)
                    .lineLimit(1)
                    .font(.fiori(forTextStyle: .subheadline))
                    .foregroundStyle(Color.preferredColor(.secondaryLabel))
            } action: {
                Button {} label: {
                    HStack(spacing: 2) {
                        Text("See All (\(self.steps.count))")
                            .foregroundStyle(Color.preferredColor(.tintColor))
                            .font(.fiori(forTextStyle: .subheadline))
                            .foregroundStyle(Color.preferredColor(.tintColor))
                        FioriIcon.actions.slimArrowRight
                            .foregroundStyle(Color.preferredColor(.separator))
                    }
                }
            }
            .onChange(of: self.selection, {
                self.updateCurrentStepName()
            })
            .onAppear {
                self.updateCurrentStepName()
            }
        }
    }
    
    func currentStep() -> StepItem? {
        func findStep(in data: [StepItem]) -> StepItem? {
            for step in data {
                if step.id == self.selection {
                    return step
                }
                
                if !step.substeps.isEmpty {
                    if let foundItem = findStep(in: step.substeps) {
                        return foundItem
                    } else {
                        continue
                    }
                }
            }
            
            return nil
        }
        return findStep(in: self.steps)
    }
    
    func updateCurrentStepName() {
        let selectedTitle = "\(currentStep()?.title ?? "Order Progress")"
        if self.title != selectedTitle {
            self.title = selectedTitle
        }
    }
}

#Preview("No header") {
    StepProgressIndicatorView(steps: Order.progress1)
}

#Preview("With header") {
    StepProgressIndicatorView(steps: Order.progress1, noHeader: false)
}
