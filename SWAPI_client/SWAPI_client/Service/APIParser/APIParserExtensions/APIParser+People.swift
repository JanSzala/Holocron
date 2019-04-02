//
//  APIParser+People.swift
//  SWAPI_client
//
//  Created by JanSzala on 02/04/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation

extension APIParser: APIParserTypePeople {
    func parse(listPeopleResponse: APIServiceResponseType, onSuccess: @escaping APICompletionPeople, onFailure: @escaping APIParserFailure) {
        parse(response: listPeopleResponse, onSuccess: { (response: PeopleResponse) in
            onSuccess(response)
        }, onFailure: onFailure)
    }
}
