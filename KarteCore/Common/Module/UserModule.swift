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

/// ユーザー情報に関連する処理をフックするためのモジュールタイプです。
///
/// **サブモジュールと連携するために用意している機能であり、通常利用で使用することはありません。**
public protocol UserModule: ModuleBase {
    /// ビジターIDの再生成をハンドルします。
    ///
    /// - Parameters:
    ///   - current: 現在のビジターID
    ///   - previous: 直前のビジターID
    func renew(visitorId current: String, previous: String)
}
