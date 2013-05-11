//
//  HeaderView.h
//  MyCollectionView
//
//  Created by Aleksey on 09.05.13.
//  Copyright (c) 2013 Aleksey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTCollectionView.h"

@interface HeaderView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;

- (void)customizeWithText:(NSString *)text;

@end
