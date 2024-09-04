import Foundation
import Observation

@Observable
class ProverbViewModel {
    var proverModel: ProverbModel = ProverbModel.defaultQuote()
    
    let urlString = "https://chinese-proverbs.onrender.com/api/proverbs/random"
    
    func getRandomQuote() {
        getQuote(urlString: urlString)
    }
    
    private func getQuote(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let jsonDecoder = JSONDecoder()
            if let error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("data was nill")
                return
            }
            
            do {
                let newProverbModel = try jsonDecoder.decode(ProverbModel.self, from: data)
                print(newProverbModel.proverb)
                
                DispatchQueue.main.async {
                    self.proverModel = newProverbModel
                }
            }catch {
                print(data.description)
                print(error)
            }
        }
        
        task.resume()
    }
}
