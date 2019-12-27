import Foundation
import Combine

class ArticleListViewModel: ObservableObject {
    @Published var articleListViewModel = [ArticleViewModel]()
    
    var articles = [ArticleViewModel]() {
        didSet {
            
        }
    }
    private func fetchNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=32e6468c44d84dceb0afb8444f26f68b") else {
            fatalError("Please check url!")
        }
        
        Webservice().loadNews(url: url) { (articles) in
            if let articles = articles {
                self.articles = articles.map(ArticleViewModel.init)
            }
        }
    }
}
