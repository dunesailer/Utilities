public enum StandardError: Error {
    case invalidParameterError(message: String)
    case illegalOperationError(message: String)
    case operationFailedError(message: String)
}
