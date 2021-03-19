//
//  CryptographyExtensions.swift
//  RemindersSwiftApp
//
//  Created by Shridhar Damale on 6/29/20.
//  Copyright (C) 2020 Acoustic, L.P. All rights reserved.
//

import Foundation
/*
 
 
This file is provided as is and as sample only. You should implement your own extension NSString for encryption-decryption as per your security policy. You do not have to have these methods or categories. This is optional. If these methods are implemented in your application, Tealeaf SDK  would call these APIs before saving data to local storage. If you choose to implement these; please test the methods properly; make sure there is a faithful encryption and decryption of the JSON string passed in. SDK relies on your application's NSString ecryption decryption methods. SDK itself does not encrypt, decrypt or validate if these operations are successful. Hence carefully implement and test.
*/

var keyStr = ""; //@"<please enter 32 byte long key here>" For example: 0123456789abcdef>;
@objc extension NSString {
    @objc public func encryptTealeafData() -> NSString?{
        var encryptedString = self
        if( (keyStr.count > 0) && (self.length > 0) ){
            do {
                let keyData = Data(base64Encoded: keyStr)!
                let publicKey = SecKeyCreateWithData(keyData as NSData, [
                    kSecAttrKeyType: kSecAttrKeyTypeRSA,
                    kSecAttrKeyClass: kSecAttrKeyClassPrivate,
                ] as NSDictionary, nil)!
                let algorithm: SecKeyAlgorithm = .rsaEncryptionOAEPSHA512
                var error: Unmanaged<CFError>?
                guard let encryptedData = SecKeyCreateEncryptedData(publicKey,
                                                                 algorithm,
                                                                 encryptedString as! CFData,
                                                                 &error) as Data? else {
                                                                    throw error!.takeRetainedValue() as Error
                }
                //encryptedString = String(decoding: encryptedData, as: UTF8.self) as NSString? ?? ""
                encryptedString = encryptedData .base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters) as NSString
            } catch {
                print(error)
            }
        }
        return encryptedString
    }

    @objc public func decryptTealeafData() -> NSString?{
        var decryptedString = self
        if( (keyStr.count > 0) && (self.length > 0) ){
            do {
                let keyData = Data(base64Encoded: keyStr)!
                let publicKey = SecKeyCreateWithData(keyData as NSData, [
                    kSecAttrKeyType: kSecAttrKeyTypeRSA,
                    kSecAttrKeyClass: kSecAttrKeyClassPrivate,
                ] as NSDictionary, nil)!
                let algorithm: SecKeyAlgorithm = .rsaEncryptionOAEPSHA512
                var error: Unmanaged<CFError>?
                guard let decryptedData = SecKeyCreateDecryptedData(publicKey,
                                                                 algorithm,
                                                                 decryptedString as! CFData,
                                                                 &error) as Data? else {
                                                                    throw error!.takeRetainedValue() as Error
                }
                decryptedString = String(decoding: decryptedData, as: UTF8.self) as NSString? ?? ""
            } catch {
                print(error)
            }
        }
        return decryptedString
    }

}
