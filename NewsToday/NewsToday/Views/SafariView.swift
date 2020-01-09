import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
   
    typealias UIViewControllerType = SFSafariViewController

    var url: URL?
    
    init(_ url: String) {
        self.url = URL(string: url)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url!)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(sampleNewsUrl)
    }
}
