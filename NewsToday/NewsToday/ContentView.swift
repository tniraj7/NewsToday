import SwiftUI


struct ContentView : View {
    
    @ObservedObject var model = ArticleListViewModel()
    
    var body: some View {
        NavigationView {
            List(model.articles) { article in
                VStack(alignment: .leading) {
                    
                    Text(article.title)
                        .lineLimit(nil)
                    
                    Text(article.description)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                }
            }
            .navigationBarTitle(Text("Top Headlines"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
