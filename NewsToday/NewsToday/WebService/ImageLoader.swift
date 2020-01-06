import Foundation
import  UIKit
import Combine

class ImageLoader: ObservableObject {

    @Published var isImageValid = false
    var data: Data?
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, res, err in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
                self.isImageValid = true
            }
        }
        task.resume()
    }
    
    func imageFromData(_ data:Data) -> UIImage {
        UIImage(data: data) ?? UIImage()
    }
}
