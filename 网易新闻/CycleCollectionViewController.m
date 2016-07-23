//
//  CycleCollectionViewController.m
//  网易新闻
//
//  Created by iMac on 16/7/21.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import "CycleCollectionViewController.h"
#import "CycleModel.h"
#import "CycleCollectionViewCell.h"
@interface CycleCollectionViewController ()
@property (nonatomic, strong) NSArray * dataArr;
@property (nonatomic, weak)IBOutlet UICollectionViewFlowLayout * flowLayout;
@property (nonatomic, strong) UIPageControl * pageControl;
@end

@implementation CycleCollectionViewController


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.flowLayout.itemSize = self.collectionView.bounds.size;
    


}
- (void)viewDidLoad {
    [super viewDidLoad];
    //加载pageControl
    [self loadPageControl];
    
   //加载模型数据
    [self loadDataModel];
    
}
-(void)loadDataModel{
    [CycleModel loadCycleModel:@"ad/headline/0-4.html" successBlock:^(NSArray *arr) {
        //赋值(传递数据)
        self.dataArr = arr;
        //刷新数据
        [self.collectionView reloadData];
        //设置page的点点个数
        self.pageControl.numberOfPages = self.dataArr.count;
        //计算pageControl 的size
        CGSize pageControlSize = [self.pageControl sizeForNumberOfPages:arr.count];
        //设置pagecontrol 的frame
        CGFloat pageX = self.view.bounds.size.width - pageControlSize.width - 5;
        CGFloat pageY = self.view.bounds.size.height - pageControlSize.height;
        
        self.pageControl.frame = CGRectMake(pageX, pageY, pageControlSize.width, pageControlSize.height);
        
        
        //刷新完后  直接跳到第四个
        NSIndexPath * index = [NSIndexPath indexPathForItem:self.dataArr.count inSection:0];
        [self.collectionView scrollToItemAtIndexPath:index atScrollPosition:0 animated:NO];
        
    } failBlock:^(NSError *error) {
        
        
    }];
    
}
//创建pageControl
-(void)loadPageControl{
    self.pageControl = [[UIPageControl alloc]init];
    
    NSLog(@"%@",self.view.subviews);
    
    NSLog(@"---%@",self.collectionView.subviews);
    
    [self.view addSubview:self.pageControl];
    //选中时的颜色
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    //未选中的
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];

}

//当减速滚动时,半段item是第一个还是最后一个

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat scrollViewW = scrollView.bounds.size.width;
    CGFloat offSetX = scrollView.contentOffset.x;
    
    NSInteger index = offSetX / scrollViewW;
    
       //根据索引 确定 当前显示的 pageControl 的小点点
    self.pageControl.currentPage = index % self.dataArr.count;
    
    //重新获取item
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    
    NSIndexPath *indexPath;
    if (index == 0) {
        //跳到第四个
        indexPath = [NSIndexPath indexPathForItem:self.dataArr.count inSection:0];
        
    }else if (index == items - 1){
        //跳到第3个
        indexPath = [NSIndexPath indexPathForItem:self.dataArr.count - 1 inSection:0];
    }
    
    
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.dataArr.count*2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CycleCollectionViewControllerCell" forIndexPath:indexPath];
    
//   cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    CycleModel *model = self.dataArr[indexPath.item % self.dataArr.count];
    cell.model = model;
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
