class Mapper<T1,T2> {
    
    func map(viewModel:T1) -> T2{
        fatalError("must implement map")
    }
    
    func reverseMap(model: T2) -> T1{
        fatalError("must implement reverse map")
    }
}
