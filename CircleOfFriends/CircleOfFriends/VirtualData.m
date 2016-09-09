//
//  VirtualData.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/23.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "VirtualData.h"
#import "CircleOfFriendsData.h"
#import "VirtualComment.h"
#import "CommentData.h"

@implementation VirtualData

+ (NSArray *)getVirtualData {
    CircleOfFriendsData *data0 = [[CircleOfFriendsData alloc] init];
    data0.type = ContentOnly;
    data0.place = @"长沙";
    data0.content = @"在比赛进行的时候，阿根廷全国几乎陷入了停顿状态。";
    data0.avatarUrlString = @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1471934222&di=08bf8b41f2d7e040edfec1f7e2330650&src=http://www.ld12.com/upimg358/20160130/050750184153383.jpg";
    data0.userID = @"初音歌姬";
    data0.sendTime = @"三小时前";
    data0.commentArray = [VirtualComment getVitualComment];
    data0.likeUserArray = @[@"玛茵",@"冈部伦太郎",@"小鸟游六花",@"小鸟游十花",@"嘟嘟噜",@"玛茵",@"冈部伦太郎",@"小鸟游六花"];
    
    
    CircleOfFriendsData *data1 = [[CircleOfFriendsData alloc] init];
    data1.type = ContentWithImages;
    data1.content = @"阿万音铃羽（あまね すずは，Amane Suzuha）日本ACG作品《命运石之门》的主要角色之一。2017年9月27日出生，O型血。在α世界线中是一名在未来道具研究所楼下的“映像管工房”打零工的元气少女，热爱山地车与映像管。";
    data1.avatarUrlString = @"http://file.popoho.com/2016-07-18/d61b13ef2ec44202c022a837d6294523.jpg";
    data1.userID = @"Monkey.D.Luffy";
    data1.sendTime = @"四小时前";
    data1.imageArray = @[@"http://img5.duitang.com/uploads/item/201409/02/20140902121705_Hy5G2.thumb.700_0.jpeg",
                         @"http://imgsrc.baidu.com/forum/w%3D580/sign=9a3267089045d688a302b2ac94c37dab/7b27d60735fae6cd2246055a0db30f2442a70f23.jpg",
                         @"http://pic.baike.soso.com/p/20140421/20140421140142-1339568717.jpg",
                         @"http://f.hiphotos.baidu.com/album/scrop%3D300%3Bq%3D90/sign=7417f649dd54564ee13ba366c3e3afb2/4e4a20a4462309f7ad116748720e0cf3d7cad66a.jpg",
                         @"http://g.hiphotos.baidu.com/zhidao/pic/item/bba1cd11728b47108f49438dc5cec3fdfc032308.jpg",
                         @"http://v1.qzone.cc/skin/201511/28/17/23/5659729355df3093.jpg%21600x600.jpg"];
    data1.commentArray = [VirtualComment getVitualComment];
    
    CircleOfFriendsData *data2 = [[CircleOfFriendsData alloc] init];
    data2.type = ContentWithShare;
    data2.content = @"《斩·赤红之瞳！》是由タカヒロ原作、田代哲也作画的漫画，于《月刊GANGAN JOKER》2010年4月号开始连载。2014年1月在《月刊GANGAN JOKER》杂志封面上公布了TV动画化的消息。电视动画由WHITE FOX制作，于2014年7月6日开始放送。";
    data2.sendTime = @"昨天";
    data2.avatarUrlString = @"http://i1.hdslb.com/user/69904/6990414/myface.jpg";
    data2.userID = @"牧濑红莉栖";
    
    CircleOfFriendsData *data3 = [[CircleOfFriendsData alloc] init];
    data3.type = ImageOnly;
    data3.avatarUrlString = @"http://cdnq.duitang.com/uploads/item/201504/13/20150413H2602_rPRjY.png";
    data3.imageArray = @[ @"http://pic.baike.soso.com/p/20140421/20140421140142-1339568717.jpg"];
    data3.sendTime = @"一小时前";
    data3.userID = @"宫园薰";
    data3.place = @"长沙.动漫城";
    
    CircleOfFriendsData *data4 = [[CircleOfFriendsData alloc] init];
    data4.type = ShareOnly;
    data4.userID = @"马化腾";
    data4.sendTime = @"四天前";
    data4.avatarUrlString = @"http://pic.baike.soso.com/p/20140421/20140421140142-1339568717.jpg";
    data4.commentArray = [VirtualComment getVitualComment];
    
    CircleOfFriendsData *data5 = [[CircleOfFriendsData alloc] init];
    data5.type = ContentOnly;
    data5.content = @"顽皮狗（Naughty Dog）是一家全球知名的电子游戏开发工作室，创建于1984年，前身为果酱软件，现为索尼公司旗下全资子公司，隶属于索尼全球工作室。顽皮狗以其独特的精品开发战略获得了业界广泛赞誉，旗下作品虽然不多，但个个受到媒体与玩家一致好评，并且收获业界无数荣誉与大奖，至今为止顽皮狗已有两款作品，神秘海域3和最后的生还者均获得了IGN的满分评价。另外神秘海域2和最后的生还者还分别获得了多家著名媒体评选的年度最佳游戏大奖。";
    data5.avatarUrlString = @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1471934222&di=08bf8b41f2d7e040edfec1f7e2330650&src=http://www.ld12.com/upimg358/20160130/050750184153383.jpg";
    data5.userID = @"初音歌姬";
    data5.sendTime = @"五天前";
    CommentData *data = [[CommentData alloc] init];
    data.commentContent = @"索尼大法好";
    data.commentFromUserID = @"蕾姆酱";
    data5.commentArray = @[data];
    data5.likeUserArray = @[@"拉姆酱"];
    
    CircleOfFriendsData *data6 = [[CircleOfFriendsData alloc] init];
    data6.type = ContentWithImages;
    data6.userID = @"小鸟游六花";
    data6.content = @"小鸟游六花日本轻小说改编的动画《中二病也要谈恋爱》系列中的女主角[1-2]  。富樫勇太的同班同学兼女朋友。父亲的突然离世，令她至今无法接受这个事实。正在她最痛苦无助的时候，遇上了中二的富樫勇太。她相信父亲在“不可视境界线”另端的平行世界，为寻找“不可视境界线”而患上中二病。";
    data6.avatarUrlString = @"http://img4.duitang.com/uploads/item/201507/31/20150731151705_YehQv.thumb.700_0.png";
    data6.sendTime = @"一小时前";
    data6.place = @"长沙.悦方IDMall";
    data6.imageArray =@[@"http://ww1.sinaimg.cn/large/6ff56acagw1efma9dlqicj20fw0m8jsu.jpg",@"http://img4q.duitang.com/uploads/item/201502/10/20150210012545_Wwwxz.jpeg",@"http://www.qq1234.org/uploads/allimg/140901/3_140901103140_3.jpg",@"http://img4.duitang.com/uploads/item/201507/31/20150731151705_YehQv.thumb.700_0.png"];
    data6.likeUserArray = @[@"漆黑烈焰使",@"樱满集",@"南小鸟"];
    CommentData *comment = [[CommentData alloc] init];
    comment.commentContent = @"来自漆黑烈焰使的魔法";
    comment.commentFromUserID = @"乙坂有宇";
    data6.commentArray = @[comment];
    

    NSArray *dataArray = @[data0,data1,data2,data4,data3,data5,data6];
    
    return dataArray;
}

@end
