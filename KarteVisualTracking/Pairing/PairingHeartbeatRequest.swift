//
//  Copyright 2020 PLAID, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import KarteCore
import KarteUtilities

internal struct PairingHeartbeatRequest: Request {
    typealias Response = String

    let configuration: Configuration
    let appKey: String
    let visitorId: String
    let account: Account

    var baseURL: URL {
        configuration.baseURL
    }

    var method: HTTPMethod {
        .post
    }

    var path: String {
        "/v0/native/auto-track/pairing-heartbeat"
    }

    var headerFields: [String: String] {
        [
            "X-KARTE-App-Key": appKey,
            "X-KARTE-Auto-Track-Account-Id": account.id
        ]
    }

    var bodyParameters: BodyParameters? {
        PairingHeartbeatRequestBodyParameters(visitorId: visitorId)
    }

    var dataParser: DataParser {
        StringDataParser()
    }

    init(app: KarteApp, account: Account) {
        self.configuration = app.configuration
        self.appKey = app.appKey
        self.visitorId = app.visitorId
        self.account = account
    }

    func intercept(urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.timeoutInterval = 10.0
        return urlRequest
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> String {
        guard let status = object as? String else {
            return ""
        }
        return status
    }
}
