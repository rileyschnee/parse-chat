//
//  ChatCell.m
//  ParseChat
//
//  Created by Riley Schnee on 7/9/18.
//  Copyright © 2018 Riley Schnee. All rights reserved.
//

#import "ChatCell.h"
#import "UIImageView+AFNetworking.h"
@implementation ChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setMessage:(PFObject *)message{
    _message = message;
    self.messageLabel.text = self.message[@"text"];
    PFUser *user = self.message[@"user"];
    if (user != nil) {
        // User found! update username label with username
        self.userLabel.text = user.username;
    } else {
        // No user found, set default username
        self.userLabel.text = @"🐵";
    }
    NSString *picURLString = [NSString stringWithFormat:@"https://api.adorable.io/avatars/100/%@.png", user.username];
    NSURL *picURL = [NSURL URLWithString:picURLString];
    [self.profilePicView setImageWithURL:picURL];
    self.bubbleView.layer.cornerRadius = 16;
    self.bubbleView.clipsToBounds = true;
}
@end
