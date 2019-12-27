import Foundation

class Webservice {
    
    func loadNews(url: URL, completion: @escaping ( ([Article]?) -> ()) ) {
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let response = try? JSONDecoder().decode(NewsAPIResponse.self, from: data)
            
            if let response = response {
                DispatchQueue.main.async {
                    completion(response.articles)
                }
            }
        }.resume()
    }
}
