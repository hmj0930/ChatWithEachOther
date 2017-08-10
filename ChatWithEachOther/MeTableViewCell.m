//
//  MeTableViewCell.m
//  ChatWithEachOther
//
//  Created by MJ on 2017/8/10.
//  Copyright © 2017年 韩明静. All rights reserved.
//

#import "MeTableViewCell.h"
#import "Masonry.h"

@implementation MeTableViewCell

-(UIImageView *)iconImageView{
    
    if (_iconImageView==nil) {
        _iconImageView=[UIImageView new];
        _iconImageView.layer.cornerRadius=30;
        _iconImageView.layer.masksToBounds=YES;
        _iconImageView.image=[UIImage imageNamed:@"屏幕快照 2017-08-10 下午4.04.50"];
    }
    return _iconImageView;
}

-(UILabel *)nameLabel{
    
    if (_nameLabel==nil) {
        _nameLabel=[UILabel new];
        _nameLabel.textColor=[UIColor lightGrayColor];
        _nameLabel.font=[UIFont systemFontOfSize:15];
        _nameLabel.textAlignment=NSTextAlignmentRight;
    }
    return _nameLabel;
}

-(UILabel *)contentLabel{
    
    if (_contentLabel==nil) {
        _contentLabel=[UILabel new];
        _contentLabel.font=[UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines=0;
    }
    return _contentLabel;
}

-(UIImageView *)bgImageView{
    
    if (_bgImageView==nil) {
        _bgImageView=[UIImageView new];
        _bgImageView.image=[UIImage imageNamed:@"chat_send_nor"];
    }
    return _bgImageView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        self.contentView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
        
        [self prepareSubviews];
    }
    
    return self;
}

-(void)prepareSubviews{
    
    __weak typeof(self) weakSelf=self;
    
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(weakSelf.contentView).offset(-15);
        make.top.equalTo(weakSelf.contentView).offset(15);
        make.width.height.equalTo(@60);
    }];
    
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconImageView);
        make.trailing.equalTo(weakSelf.iconImageView.mas_leading).offset(-8);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
    [self.contentView addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(weakSelf.nameLabel);
        make.leading.equalTo(weakSelf.contentView).offset(130);
        make.top.equalTo(weakSelf.nameLabel.mas_bottom);
        make.bottom.equalTo(weakSelf.contentView).offset(-8);
    }];
    
    [self.bgImageView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.bgImageView).offset(15);
        make.top.equalTo(weakSelf.bgImageView);
        make.centerX.equalTo(weakSelf.bgImageView);
        make.bottom.equalTo(weakSelf.bgImageView);
    }];
}
@end
