import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    
    init(withUrl url: String) {
        imageLoader = ImageLoader(urlString: url)
    }
    var body: some View {
        VStack {
            Image(uiImage: (imageLoader.isImageValid ? UIImage(data: imageLoader.data!) : UIImage())!)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withUrl: "https://images.wsj.net/im-141518/social")
    }
}
