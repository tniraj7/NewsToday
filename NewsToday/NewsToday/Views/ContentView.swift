import SwiftUI


struct ContentView : View {
    
    @ObservedObject var model: ArticleListViewModel = ArticleListViewModel()
    
    var body: some View {
        NavigationView {
            List(self.model.articleListViewModel) { article in
                VStack(alignment: .leading) {
                    
                    Text(article.title)
                        .lineLimit(nil)
                    
                    Text(article.description)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                }
                }
            .navigationBarTitle(Text("Top Headlines"))
        }.onAppear() {
            self.model.fetchNews()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
