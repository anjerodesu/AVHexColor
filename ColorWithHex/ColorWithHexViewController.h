//
//  ColorWithHexViewController.h
//  ColorWithHex
//
//  Created by Angelo Villegas on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorWithHexViewController : UIViewController {
    
}

@property (nonatomic, strong) IBOutlet UILabel *lblColorWithHex;
@property (nonatomic, strong) IBOutlet UILabel *lblColorWithHexString;
@property (nonatomic, strong) IBOutlet UILabel *lblColorWithAlphaHex;
@property (nonatomic, strong) IBOutlet UILabel *lblColorWithAlphaHexString;
@property (nonatomic, strong) IBOutlet UILabel *lblRandomColor;

@end
