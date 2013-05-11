//
//  ViewController.m
//  MyCollectionView
//
//  Created by Aleksey on 09.05.13.
//  Copyright (c) 2013 Aleksey. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "CollectionViewCell.h"
#import "PSTCollectionView.h"

static NSString *cellIdentifier = @"TestCell";
static NSString *headerViewIdentifier = @"Test Header View";

@interface ViewController ()
<PSUICollectionViewDataSource, PSUICollectionViewDelegate>


@property (strong, nonatomic) PSUICollectionView *collectionView;

@property (strong, nonatomic) NSArray *data;


@end

@implementation ViewController

- (void)loadView {
	[super loadView];
	
	self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
	
	PSUICollectionViewFlowLayout *collectionViewFlowLayout = [[PSUICollectionViewFlowLayout alloc] init];
	
	[collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
	[collectionViewFlowLayout setItemSize:CGSizeMake(245, 250)];
	[collectionViewFlowLayout setHeaderReferenceSize:CGSizeMake(500, 50)];
//	[collectionViewFlowLayout setFooterReferenceSize:CGSizeMake(500, 50)];
	[collectionViewFlowLayout setMinimumInteritemSpacing:10];
	[collectionViewFlowLayout setMinimumLineSpacing:10];
	[collectionViewFlowLayout setSectionInset:UIEdgeInsetsMake(10, 0, 20, 0)];
	
	self.collectionView = [[PSUICollectionView alloc] initWithFrame:CGRectMake(floorf((CGRectGetWidth(self.view.bounds)-500)/2), 0, 500, CGRectGetHeight(self.view.bounds)) collectionViewLayout:collectionViewFlowLayout];
	[self.collectionView setDelegate:self];
	[self.collectionView setDataSource:self];
	[self.collectionView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin];
	[self.collectionView setBackgroundColor:[UIColor redColor]];
	
//	[self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    UINib *cellNib = [UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:cellIdentifier];

    
//	[self.collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:PSTCollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
    
    UINib *headerNib = [UINib nibWithNibName:@"HeaderView" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:PSTCollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
	
	[self.view addSubview:self.collectionView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.data = @[
             @[@"One", @"Two", @"Three"],
             @[@"Four", @"Five", @"Six"],
             @[],
             @[@"Seven"],
             ];
}

#pragma mark -
#pragma mark PSUICollectionView stuff

- (NSInteger)numberOfSectionsInCollectionView:(PSUICollectionView *)collectionView {
    return [self.data count];
}


- (NSInteger)collectionView:(PSUICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.data objectAtIndex:section] count];
}


- (PSUICollectionViewCell *)collectionView:(PSUICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PSUICollectionViewCell *cell = (PSUICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[cell viewWithTag:123];
    label.text  = [[self.data objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
}

- (PSUICollectionReusableView *)collectionView:(PSUICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
	NSString *identifier = nil;
	
	if ([kind isEqualToString:PSTCollectionElementKindSectionHeader]) {
		identifier = headerViewIdentifier;
	}
    
    PSUICollectionReusableView *supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier forIndexPath:indexPath];
    [(HeaderView *)supplementaryView customizeWithText:@"hello! i'm custom header text"];

	
    // TODO Setup view
	
    return supplementaryView;
}

@end
