import SwiftUI
import KingfisherSwiftUI

struct ImageView: View {
    var url: String
    var text: String
    
    init(url: String, text: String) {
        self.url = url
        self.text = text
    }

    var rectangle: some View {
        Rectangle()
            .foregroundColor(Color.clear)
            .background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
    }
    
    var title: some View {
        Text(self.text)
            .font(.footnote)
            .fontWeight(.semibold)
            .padding([.leading, .trailing], 5.0)
            .fixedSize(horizontal: false, vertical: false)
            .foregroundColor(Color.white)
            .lineLimit(5)
            .offset(y: 75)
    }

    var body: some View {
            KFImage(URL(string: url), options: [.transition(.fade(1))])
                .renderingMode(.original)
                .resizable()
                .frame(width: 370, height: 210)
                .cornerRadius(20)
                .overlay(self.rectangle)
                .overlay(title)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: sampleImageUrl,text: sampleText).environment(\.colorScheme, .dark)
    }
}
