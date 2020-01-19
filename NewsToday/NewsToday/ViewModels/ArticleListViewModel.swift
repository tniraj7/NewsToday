import Foundation
import Combine

class ArticleListViewModel: ObservableObject {

    @Published var articleListViewModel = [ArticleViewModel]()
    
    func fetchNews() {
        guard let url = URL(string: newsApiUrl) else {
            fatalError("Please check url!")
        }
        
        Webservice().loadNews(url: url) { (newsArticles) in
            if let articles = newsArticles {
                self.articleListViewModel = articles.map({ ArticleViewModel.init(article: $0) })
            }
        }
    }
}
