//
//  ViewModel.swift
//  test
//
//  Created by 浅沼紅葉 on 2025/04/14.
//

import Foundation
import SwiftUI

struct CountInfo: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var number: Int = 0
}

class ViewModel: ObservableObject {
    @Published var CountInfos: [CountInfo] = []
}

//public enum EditMode {
//    case inactive
//    case transient
//    case active
//    public var isEditing: Bool { get }
//}
//
//extension EnvironmentValues {
//    public var editMode: Binding<EditMode>?
//}

