func switchAndContinue<Value, Return>(
    continuation: CheckedContinuation<Return, Error>,
    value: Value?,
    error: Error?,
    valueBlock: (_ value: Value) throws -> Return
) rethrows {
    switch (value, error) {
    case (nil, nil): continuation.resume(throwing: HealthKitManager.Error.unexpectedNilValueAndNilError)
    case let (nil, error?): continuation.resume(throwing: error)
    case let (value?, _): continuation.resume(returning: try valueBlock(value))
    }
}

func switchAndContinue<Value>(
    continuation: CheckedContinuation<Value, Error>,
    value: Value?,
    error: Error?
) {
    switch (value, error) {
    case (nil, nil): continuation.resume(throwing: HealthKitManager.Error.unexpectedNilValueAndNilError)
    case let (nil, error?): continuation.resume(throwing: error)
    case let (value?, _): continuation.resume(returning: value)
    }
}

func switchAndContinue<Return>(
    continuation: CheckedContinuation<Return, Error>,
    value: Bool,
    error: Error?,
    successBlock: () throws -> Return
) rethrows {
    switch (value, error) {
    case (false, nil): continuation.resume(throwing: HealthKitManager.Error.unexpectedFailureWithoutError)
    case let (false, error?): continuation.resume(throwing: error)
    case (true, _): continuation.resume(returning: try successBlock())
    }
}

func switchAndContinue(
    continuation: CheckedContinuation<Bool, Error>,
    value: Bool,
    error: Error?
) {
    switch (value, error) {
    case (false, nil): continuation.resume(throwing: HealthKitManager.Error.unexpectedFailureWithoutError)
    case let (false, error?): continuation.resume(throwing: error)
    case (true, _): continuation.resume(returning: true)
    }
}
