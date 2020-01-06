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
    
    
}
