import Foundation

struct NewsAPIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
}
