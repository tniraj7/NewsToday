import SwiftUI
import KingfisherSwiftUI

struct ContentView : View {
    @State var show = false
    @State var showNews = false
    @State var showSettings = false
    
    @ObservedObject var model: ArticleListViewModel = ArticleListViewModel()
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List(self.model.articleListViewModel) { article in
                VStack(alignment: .leading) {
                    Button(action: { self.showNews.toggle() }) {
                        ImageView(url: article.urlToImage, text: article.title, width: 300, height: 230)
                            .sheet(isPresented: self.$showNews) {
                                SafariView(article.url)
                        }
                    }
                    .cornerRadius(20)
                    .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
                }
                .padding(.vertical, 20.0)
            }
            .listStyle(GroupedListStyle())
            .onAppear() {
                self.model.fetchNews()
            }
            .navigationBarTitle(Text("News Plus"))
//            .navigationBarItems(
//                trailing: Button(action: self.model.fetchNews) {
//                    Image(systemName: "arrow.clockwise.circle")
//                    .resizable()
//                    frame(width: 30, height: 30)
//                }
//            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

