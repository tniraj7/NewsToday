import Foundation
import Combine

class ArticleViewModel: Identifiable {
    
    let id = UUID()
    
    @Published var article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description ?? ""
    }
    
    var url: String {
        return self.article.url
    }
    
    var urlToImage: String {
        return self.article.urlToImage ?? ""
    }
}
