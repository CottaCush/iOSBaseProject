import EVReflection
import Foundation

class BaseResponse<T: EVNetworkingObject>: EVNetworkingObject {
    public var status: String!
    public var data: T!
    public var message: String!
    public var code: String!
}
