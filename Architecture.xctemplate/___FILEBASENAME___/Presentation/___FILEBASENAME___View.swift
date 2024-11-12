import SwiftUI

public struct ___FILEBASENAME___View: View {
    
    @ObservedObject private var presenter: Presenter<___VARIABLE_productName:identifier___State, ___VARIABLE_productName:identifier___Action>
    
    public init(presenter: Presenter<___VARIABLE_productName:identifier___State, ___VARIABLE_productName:identifier___Action>) {
        self.presenter = presenter
    }
    
    public var body: some View {
        Text("___VARIABLE_productName:identifier___View")
    }
}
