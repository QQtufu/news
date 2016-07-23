//
//  NewsTableviewCell.m
//  网易新闻
//
//  Created by iMac on 16/7/20.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import "NewsTableviewCell.h"
#import "NewsModel.h"
#import "UIImageView+WebCache.h"
@interface NewsTableviewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *sourceLab;
@property (weak, nonatomic) IBOutlet UILabel *replyLab;
@property (nonatomic, strong)IBOutletCollection(UIImageView) NSArray * imgViews;

@end
@implementation NewsTableviewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(NewsModel *)model{
    _model = model;
    [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    self.titleLab.text = model.title;
    self.sourceLab.text = model.source;
    if (model.replyCount == nil) {
        self.replyLab.text = @"0";
    }else{
    self.replyLab.text = [NSString stringWithFormat:@"%@",model.replyCount];
    }
    for (int i = 0; i < self.imgViews.count; i++) {
        //取出图片视图对应的地址
        NSDictionary *imgsrcDict = model.imgextra[i];
        NSString *img = imgsrcDict[@"imgsrc"];
        
        //设置图片
        [self.imgViews[i] sd_setImageWithURL:[NSURL URLWithString:img] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    }
    




}
@end
