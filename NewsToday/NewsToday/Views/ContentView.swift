import SwiftUI
import KingfisherSwiftUI

struct ContentView : View {
    @State var show = false
    @State var showList = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20.0) {
                TopHeadlinesView(showNews: $show)
                VStack {
                    Text("Categories")
                    .font(.system(size: 25))
                    .fontWeight(.heavy)
                    .padding([.top, .leading], 40.0)
                    Spacer()
                }
            }
            .navigationBarTitle(Text("News Plus"))
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(show: false)
    }
}

struct TopHeadlinesView: View {
    
    @ObservedObject var model: ArticleListViewModel = ArticleListViewModel()
    @Binding var showNews: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Headlines")
                .font(.system(size: 25))
                .fontWeight(.heavy)
                .padding([.top, .leading], 40.0)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30.0) {
                    ForEach(self.model.articleListViewModel) { article in
                        Button(action: { self.showNews.toggle() }) {
                            GeometryReader { gr in
                                ImageView(url: article.urlToImage, text: article.title, width: 300, height: 230)
                                .sheet(isPresented: self.$showNews) {
                                        SafariView(article.url)
                                }
                                .rotation3DEffect(
                                    Angle(degrees: Double(gr.frame(in: .global).minX - 40) / -40),
                                    axis: (x: 0.0, y: 10.0, z: 0.0)
                                )
                            }
                            .frame(width: 300, height: 230)
                        }
                        .cornerRadius(20)
                        .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
                        
                    }
                }
                .padding(40)
                .frame(height: 450)
            }
            .offset(y: -70)
            
        }.onAppear() {
            self.model.fetchNews()
        }
    }
}
