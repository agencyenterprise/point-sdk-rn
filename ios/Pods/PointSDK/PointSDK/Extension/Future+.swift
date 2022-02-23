import Combine

extension Future where Failure == Error {
    convenience init(operation: @escaping () async throws -> Output) {
        self.init { promise in
            Task {
                do { promise(.success(try await operation())) }
                catch { promise(.failure(error)) }
            }
        }
    }
}
