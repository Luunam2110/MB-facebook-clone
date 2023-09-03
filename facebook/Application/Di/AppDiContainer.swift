
import Swinject

class AppDIContainer {
    static let shared = AppDIContainer() // Singleton instance
    private let container = Container()
    let appConfiguration = AppConfiguration()
    var networkService: NetworkService?
    
    init(){
        let baseUrl = appConfiguration.baseURL
        let config = ApiDataNetworkConfig(
            baseURL: URL(string: baseUrl)!
        )
        networkService = DefaultNetworkService(config: config)
        
    }


    func registerDependencies() {
        let apiDataTransferService = DefaultDataTransferService(with: networkService!)
        // repository
        container.register(AuthRepository.self) { _ in
            AuthRepositoryImpl(dataTransferService: apiDataTransferService)
        }
        
        // use case
        container.register(AuthUseCase.self) { resolver in
            AuthUseCaseImpl(authRepository: resolver.resolve(AuthRepository.self)!)
        }
    }

    func resolve<T>(_ serviceType: T.Type) -> T {
        return container.resolve(serviceType)!
    }
}
