//
//  Created by Kenan Atmaca on 2.08.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit
import Photos

class PhotoLibPermission: KAuthProtocol {
    
    func auth(success: @escaping (Bool) -> Void) {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch (status) {
            case .authorized: success(true)
            case .denied, .notDetermined, .restricted: success(false)
            @unknown default: success(false)
            }
        }
    }
    
    var isAuth: Bool {
        return PHPhotoLibrary.authorizationStatus() == .authorized
    }
}
