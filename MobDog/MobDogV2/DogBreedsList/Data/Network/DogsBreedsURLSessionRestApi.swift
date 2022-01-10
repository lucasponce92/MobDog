import Foundation

struct DogsBreedsURLSessionRestApi: DogsBreedsRestApi{
    
    func dogsBreeds(completionHandler: @escaping (DogsBreeds?) -> Void) {
        let url = Endpoints.dogsBreedsList()
        Webservice.invoke(urlPath: url, httpMethod: HttpMethod.GET, finished: { data, status, msg in
            if let data = data {
                do{
                    let dogsBreeds: DogsBreeds = try JSONDecoder().decode(DogsBreeds.self, from: data)
                    completionHandler(dogsBreeds)
                    
                }catch{
                    print(error)
                }
                
            } else {
                //implementar error
            }
        })
    }
}
