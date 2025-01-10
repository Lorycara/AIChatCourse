
import Foundation
import SwiftUI

struct ReadableImage: ViewModifier {
    
    var shadowColor: Color = .black.opacity(0.8)

    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(colors: [shadowColor.opacity(0),shadowColor.opacity(0.6)],startPoint: .top,endPoint: .bottom)
            
            ,alignment: .bottom )
    }
    
}
struct ReadableImageBig: ViewModifier {
    
    var shadowColor: Color = .black.opacity(0.8)

    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(colors: [shadowColor.opacity(0), shadowColor.opacity(0.6), shadowColor.opacity(0.8)],startPoint: .top,endPoint: .bottom)
            
            ,alignment: .bottom )
    }
    
}

public extension View {
    
    /// Add a color background with corner radius.
    func readableBigImage() -> some View {
        modifier(ReadableImageBig())
    }
    func readableImage() -> some View {
        modifier(ReadableImage())
    }
    
}
