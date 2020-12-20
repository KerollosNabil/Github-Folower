//
//  UserItemsTest.swift
//  UserInfoTests
//
//  Created by MAC on 20/12/2020.
//

import XCTest
@testable import Github_Folower 

class UserItemsTest: XCTestCase {
    var sut: UserInfoVC!
    override func setUpWithError() throws {
        sut = UserInfoVC(user: Follower(login: "Sallen0400", avatarUrl: "https://avatars2.githubusercontent.com/u/10645516?v=4"))
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testUserInfo_isConformToUserInfoProtocol() {
        
    }

}
