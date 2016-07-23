//
//  XDHomeController.m
//  网易新闻
//
//  Created by iMac on 16/7/19.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import "XDHomeController.h"
#import "ChannelLabel.h"
#import "XDChannel.h"
#import "XDHomeControllercell.h"
@interface XDHomeController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, weak)IBOutlet UICollectionView * newsCollectionview;
@property (nonatomic, weak)IBOutlet UICollectionViewFlowLayout * flowLayout;
@property (nonatomic, weak)IBOutlet UIScrollView * channelSV;
//数据数组
@property (nonatomic, strong) NSArray * dataArr;
//标签数组
@property (nonatomic, strong) NSMutableArray * labM;

@end
@implementation XDHomeController
-(NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [XDChannel channels];
    }


    return _dataArr;
}
//懒加载
-(NSMutableArray *)labM{
    if (_labM == nil) {
        _labM = [NSMutableArray array];
    }


    return _labM;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.flowLayout.itemSize = self.newsCollectionview.bounds.size;
//    self.newsCollectionview.contentSize = CGSizeMake(self.flowLayout.itemSize.width * self.dataArr.count, 0);


}
- (void)viewDidLoad
{

    self.view.backgroundColor = [UIColor yellowColor];
    //当nav和scrollV 同时使用时  会导致向下偏移44
    self.automaticallyAdjustsScrollViewInsets = NO;
    
   
    
    [self creatLabel];
    
  
 
    
}
-(void)creatLabel{
    //设置界面
    
        //    self.lab = [[UILabel alloc]init];
        
        float labW = 80;
        float labH = self.channelSV.bounds.size.height;
        
        for (int i = 0; i < self.dataArr.count; i++) {
            
            ChannelLabel *lab = [[ChannelLabel alloc]init];
            
            
          lab.frame = CGRectMake(labW * i, 0, labW, labH);
            
           
            //        lab.text = [NSString stringWithFormat:@"%@",self.labelArr[i]];
            XDChannel *model = self.dataArr[i];
            lab.text = model.tname;
            lab.tag = i;
//            if (lab.center.x == self.view.center.x) {
//                lab.textColor = [UIColor redColor];
//            }
            
            [self.channelSV addSubview:lab];
            //设置滚动
            self.channelSV.contentSize = CGSizeMake(labW * self.dataArr.count, 0);
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labClick:)];
            [lab addGestureRecognizer:tap];
            lab.userInteractionEnabled = YES;
            [self.labM addObject:lab];
            if (i ==0) {
                lab.textColor = [UIColor redColor];
                lab.font = [UIFont systemFontOfSize:20];;
            }
            
                 }
    }




//点击方法  ":"后面的参数  只能传本身
-(void)labClick:(UITapGestureRecognizer *)tap  {
    //获取选中的lab
   ChannelLabel *lab =(ChannelLabel *)tap.view;
    //lab的偏移量
    CGFloat labOffSetX = lab.center.x - self.view.bounds.size.width/2;
    
    CGFloat minOffSetX = 0;
    CGFloat maxOffSetX = self.channelSV.contentSize.width - self.view.bounds.size.width;
    
    if (labOffSetX < minOffSetX) {
        labOffSetX = minOffSetX;
    }else if (labOffSetX > maxOffSetX){
        
        labOffSetX = maxOffSetX;
    }
    // 设置频道滚动视图的滚动
    [self.channelSV setContentOffset:CGPointMake(labOffSetX, 0) animated:YES];
   
    
#pragma mark - 点击频道标签居中时,collectionView也跟着联动
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:lab.tag inSection:0];
    [self.newsCollectionview scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:YES];
    // 获取选中label的tag
    NSInteger index = lab.tag;
    
    for (int i = 0; i < self.labM.count; ++i) {
        // 遍历出所有的label
        ChannelLabel *label = self.labM[i];
        // 把选中的缩放到最大
        if (index == i ) {
            label.textColor = [UIColor redColor];
            label.font = [UIFont systemFontOfSize:20];;
        } else {
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:16];
        }
    }
    
   
    
    
}
#pragma mark - 监听底部conllectionView的滚动 : 滚动结束的代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    //获取选中的lab
    ChannelLabel *lab = self.labM[index];
    //lab的偏移量
    CGFloat labOffSetX = lab.center.x - self.view.bounds.size.width/2;
    
    CGFloat minOffSetX = 0;
    CGFloat maxOffSetX = self.channelSV.contentSize.width - self.view.bounds.size.width;
    
    if (labOffSetX < minOffSetX) {
        labOffSetX = minOffSetX;
    }else if (labOffSetX > maxOffSetX){
        
        labOffSetX = maxOffSetX;
    }
    // 设置频道滚动视图的滚动
    [self.channelSV setContentOffset:CGPointMake(labOffSetX, 0) animated:YES];




}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XDHomeControllercell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    XDChannel *model = self.dataArr[indexPath.item];
    
//    NSLog(@"model  %@",model.tid);
    NSString *str = [NSString stringWithFormat:@"article/list/%@/0-20.html",model.tid];
    //把str 传给 cell
    cell.urlStr = str;
    


    return cell;
}

@end
