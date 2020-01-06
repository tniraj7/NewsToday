import SwiftUI


struct ContentView : View {
    
    @ObservedObject var model: ArticleListViewModel = ArticleListViewModel()
    
    var body: some View {
        NavigationView {
            List(self.model.articleListViewModel) { article in
                
                VStack(alignment: .leading, spacing: 10.0) {
                    ImageView(withUrl: article.urlToImage)
                    Text(article.title)
                        .font(.headline)
                        .lineLimit(nil)
                    Spacer()
                    Text(article.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                }
                .shadow(radius: 20)
                .padding(.vertical, 20.0)
                
            }.listStyle(GroupedListStyle())
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
