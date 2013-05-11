//
//  CollectionViewCell.m
//  MyCollectionView
//
//  Created by Aleksey on 09.05.13.
//  Copyright (c) 2013 Aleksey. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self setBackgroundColor:[UIColor yellowColor]];
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, floor((CGRectGetHeight(self.bounds)-30)/2), CGRectGetWidth(self.bounds), 30)];
		[label setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
		[label setTag:123];
		[label setBackgroundColor:[UIColor clearColor]];
		[label setTextAlignment:NSTextAlignmentCenter];
		[self addSubview:label];
	}
	return self;
}

@end
