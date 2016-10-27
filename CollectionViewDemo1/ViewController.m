//
//  ViewController.m
//  CollectionViewDemo1
//
//  Created by IOS.Mac on 16/10/27.
//  Copyright © 2016年 com.elepphant.pingchuan. All rights reserved.
//

//使用CollectionView实现横向滚动

#import "ViewController.h"
#import "MyCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    _collectionView = ({
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(130, 130);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 2;

        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 244, self.view.frame.size.width,130) collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.scrollsToTop = NO;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:kMyCollectionViewCellID];
        [self.view addSubview:collectionView];
        collectionView;
    });

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}


- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     return [collectionView dequeueReusableCellWithReuseIdentifier:kMyCollectionViewCellID forIndexPath:indexPath];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [(MyCollectionViewCell *)cell configureCellWithPostURL:@"postImage.jpg"];
}




@end
