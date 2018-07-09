//
//  ChatCell.h
//  ParseChat
//
//  Created by Riley Schnee on 7/9/18.
//  Copyright © 2018 Riley Schnee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse.h"
@interface ChatCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) PFObject* message;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicView;
@property (weak, nonatomic) IBOutlet UIView *bubbleView;
@end


