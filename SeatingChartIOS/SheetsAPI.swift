//
//  SheetsAPI.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 1/25/17.
//  Copyright © 2017 DEAN, JOSHUA. All rights reserved.
//

import UIKit
import AppAuth
import GTMAppAuth
import GoogleAPIClient
import GoogleAPIClientForREST

//Global Data
var fileList: [GTLDriveFile] = []
var currentFile: GTLDriveFile?

class SheetsAPI: NSObject
{
    private let kKeychainItemName = "SeatingChartIOS"
    private let kClientID = "974204174547-p3vuej87lqp38nkvmjgcb0askle6cqj7.apps.googleusercontent.com"
    private let kRedirectURI = "com.googleusercontent.apps.974204174547-p3vuej87lqp38nkvmjgcb0askle6cqj7:/oauthredirect"
    private let kIssuer = "https://accounts.google.com"
    let appDelegate = (UIApplication.shared.delegate! as! AppDelegate)
    
    var authorization: GTMAppAuthFetcherAuthorization?
    private let service = GTLRSheetsService()
    private let driveService = GTLServiceDrive()
    
    func auth(viewController: UIViewController)
    {
        let issuer = URL(string: kIssuer)!
        let redirectURI = URL(string: kRedirectURI)!
        
        // discovers endpoints
        OIDAuthorizationService.discoverConfiguration(forIssuer: issuer, completion: {(_ configuration: OIDServiceConfiguration?, _ error: Error?) -> Void in
            if configuration == nil {
                return
            }
            // builds authentication request
            let scopes = [kGTLRAuthScopeSheetsSpreadsheets, kGTLRAuthScopeDrive]
            let request = OIDAuthorizationRequest(configuration: configuration!, clientId: self.kClientID, scopes: scopes, redirectURL: redirectURI, responseType: OIDResponseTypeCode, additionalParameters: nil)
            // performs authentication request
            self.appDelegate.currentAuthorizationFlow = OIDAuthState.authState(byPresenting: request, presenting: viewController, callback: {(_ authState: OIDAuthState?, _ error: Error?) -> Void in
                if authState != nil {
                    self.authorization = GTMAppAuthFetcherAuthorization(authState: authState!)
                    self.service.authorizer = self.authorization
                    self.driveService.authorizer = self.authorization
                }
            })
        })
    }
    
    
    func getDataFromSheet() -> [[Any]]
    {
        var output: [[Any]] = [[]]
        if(currentFile != nil)
        {
            let range = "Sheet1"
            let query = GTLRSheetsQuery_SpreadsheetsValuesGet.query(withSpreadsheetId: currentFile!.identifier, range: range)
            //GTLRServiceCompletionHandler
            service.executeQuery(query, completionHandler: {(_ ticket: GTLRServiceTicket, _ result: Any, _ error : Error?) -> Void in
                output = ((result as! GTLRSheets_ValueRange).values!)
            })
        }
        return output
    }
    
    func updateSheetWithData(values: [[Any]])
    {
        if(currentFile != nil)
        {
            let data = GTLRSheets_ValueRange()
            data.range = "Sheet1"
            data.majorDimension = kGTLRSheets_DimensionRange_Dimension_Rows
            data.values = values
            
            let query = GTLRSheetsQuery_SpreadsheetsValuesUpdate.query(withObject: data, spreadsheetId: currentFile!.identifier, range: data.range!)
            query.valueInputOption = kGTLRSheets_BatchUpdateValuesRequest_ValueInputOption_UserEntered
            service.executeQuery(query, delegate: self, didFinish: nil)
        }
    }
}
