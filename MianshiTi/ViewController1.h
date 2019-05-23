//
//  ViewController1.h
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/5/1.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController1 : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *datas;

@end

NS_ASSUME_NONNULL_END
