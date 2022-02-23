extension Encodable {
    var jsonString: String {
        get throws {
            String(data: try JSONEncoder().encode(self), encoding: .utf8)!
        }
    }
}
