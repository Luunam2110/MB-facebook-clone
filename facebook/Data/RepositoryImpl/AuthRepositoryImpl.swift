import Foundation

final class AuthRepositoryImpl {
    private let dataTransferService: DataTransferService

    init(
        dataTransferService: DataTransferService
    ) {
        self.dataTransferService = dataTransferService
    }
}

extension AuthRepositoryImpl: AuthRepository {
    func login(
        request: LoginRequest,
        completion: @escaping (Result<UserModel, DataTransferError>) -> Void
    ) -> Cancellable? {
        
        let task = RepositoryTask()
        let endpoint = APIEndpoints.login(with: request)
        task.networkTask = dataTransferService.request(with: endpoint){ result in
            switch result {
            case .success(let response):
                let data = response.data
                KeychainManager.shared.saveToken(data.accessToken)
                KeychainManager.shared.saveRefreshToken(data.refreshToken)
                completion(.success(data.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task
    }
    
}
