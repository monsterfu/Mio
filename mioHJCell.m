//
//  mioHJCell.m
//  Mio
//
//  Created by 符鑫 on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "mioHJCell.h"

@implementation mioHJCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)segmentControlTouch:(UISegmentedControl *)sender {
    if (self.delegate&&[self.delegate respondsToSelector:@selector(mioHJCellSegmentTouch:)]) {
        [self.delegate mioHJCellSegmentTouch:sender];
    }
}
@end
