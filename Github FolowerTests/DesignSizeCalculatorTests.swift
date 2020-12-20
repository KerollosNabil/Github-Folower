//
//  DesignSizeCalculatorTests.swift
//  Github FolowerTests
//
//  Created by MAC on 12/12/2020.
//

import XCTest
@testable import Github_Folower

class DesignSizeCalculatorTests: XCTestCase {
    
    var calcultor:DesignSizeCalculator!
    let iPh11Width = 414
    let iPh11Hight = 896


    override func setUp() {
        super.setUp()
        calcultor = DesignSizeCalculator(designViewSizePortraitMode: CGSize(width: iPh11Width, height: iPh11Hight))
        
    }
    override func tearDown() {
        calcultor = nil
        super.tearDown()
    }
    
   
    func testWidthFraction(){
        XCTAssertEqual(calcultor.widthFraction(isPortrait: true), calcultor.curentViewSizePortrait.width / CGFloat(iPh11Width))
    }

}
