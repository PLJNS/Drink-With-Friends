//
//  RUDrinkAtViewController.h
//  Drink.io
//
//  Created by Paul Jones on 11/18/13.
//  Copyright (c) 2013 Principles of Informations and Data Management. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface RUDrinkAtViewController : UITableViewController <CLLocationManagerDelegate> {
    NSMutableArray * localBars;
}

- (IBAction)doneTapped:(id)sender;

@end
