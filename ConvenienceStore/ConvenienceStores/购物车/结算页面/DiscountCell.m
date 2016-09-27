//
//  DiscountCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "DiscountCell.h"

@implementation DiscountCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cellSwitch = [[UISwitch alloc] initWithFrame:AdaptationFrame(Screen_width/AdaptationWidth()-113, 17, 106, 60)];
        self.cellSwitch.on = false;
        
        [self.contentView addSubview:self.cellSwitch];
    }
    return self;
}

@end
