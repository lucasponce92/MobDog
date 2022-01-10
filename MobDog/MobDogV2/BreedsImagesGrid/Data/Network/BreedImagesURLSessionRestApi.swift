import Foundation

struct BreedImagesURLSessionRestApi: BreedImagesRestApi{
    
    func breedImages(breedName:String, completionHandler: @escaping (BreedImages?) -> Void) {
        let url = Endpoints.breedImages(breedName: breedName)
        Webservice.invoke(urlPath: url, httpMethod: HttpMethod.GET, finished: { data, status, msg in
            if let data = data {
                do{
                    let breedImages: BreedImages = try JSONDecoder().decode(BreedImages.self, from: data)
                    completionHandler(breedImages)
                    
                }catch{
                    print(error)
                }
                
            } else {
                //implementar error
            }
        })
    }
}
