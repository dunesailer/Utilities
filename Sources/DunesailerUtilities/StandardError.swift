public enum StandardError: Error {
    case invalidParameterError(String)
    case illegalOperationError(String)
    case operationFailedError(String)
}
