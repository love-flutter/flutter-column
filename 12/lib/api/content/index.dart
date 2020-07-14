import 'package:two_you_friend/api/user_info/index.dart';
import 'package:two_you_friend/util/struct/content_detail.dart';
import 'package:two_you_friend/util/struct/user_info.dart';

/// 获取内容详情接口
class ApiContentIndex {
  /// 根据内容id拉取内容详情
  StructContentDetail getOneById(String id) {
    StructContentDetail detailInfo = StructContentDetail(
        '1001',
        'hello test',
        'summary',
        'detail info ${id}',
        '1001',
        1,
        2,
        'https://i.pinimg.com/originals/e0/64/4b/e0644bd2f13db50d0ef6a4df5a756fd9.png');
    StructUserInfo userInfo = ApiUserInfoIndex.getOneById(detailInfo.uid);
    return StructContentDetail(
        detailInfo.uid,
        detailInfo.title,
        detailInfo.summary,
        detailInfo.detailInfo,
        detailInfo.uid,
        detailInfo.likeNum,
        detailInfo.commentNum,
        detailInfo.articleImage,
        userInfo: userInfo);
  }

  /// 拉取用户内容推荐帖子列表
  List<StructContentDetail> getRecommendList() {
    return [
      StructContentDetail(
        '1001',
        '长相思·一重山',
        '一重山，两重山。山远天高烟水寒，相思枫叶丹\n'
            '菊花开，菊花残。塞雁高飞人未还，一帘风月闲',
        '一重又一重，重重叠叠的山啊。山是那么远，天是那么高，烟云水气又冷又寒，可我的思念像火焰般的枫叶那样。\n'
            '菊花开了又落了，日子一天天过去。塞北的大雁在高空振翅南飞，思念的人却还没有回来。悠悠明月照在帘子上，随风飘飘然。',
        '1001',
        2,
        3,
        'http://1861.img.pp.sohu.com.cn/images/2011/9/23/15/13/u132152629_133523d58dcg215_b.jpg',
        userInfo: StructUserInfo('1001', '且听风铃',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279965-WhqyaQodpn.jpg'),
      ),
      StructContentDetail(
        '1002',
        '一络索·过尽遥山如画',
        '过尽遥山如画。短衣匹马。萧萧落木不胜秋，莫回首、斜阳下。\n'
            '别是柔肠萦挂。待归才罢。却愁拥髻向灯前，说不尽、离人话。',
        '身着短衣，单枪匹马，走过一座座风景如画的山峦。树木不敌秋霜，落叶纷纷飘坠。夕阳下，切莫回首望乡，这样只能徒增伤感。\n'
            '离家之后，与你彼此深深牵挂，只有等回家之后这牵挂才能放下。到那时，我们会灯前相对，有着说不完的情话。',
        '1001',
        3,
        4,
        'http://1861.img.pp.sohu.com.cn/images/2011/9/23/15/13/u132152629_133523d9e7eg213_b.jpg',
        userInfo: StructUserInfo('1002', '微光倾城',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279965-WhqyaQodpn.jpg'),
      ),
      StructContentDetail(
        '1003',
        '武陵春·春晚',
        '风住尘香花已尽，日晚倦梳头。物是人非事事休，欲语泪先流。\n'
            '闻说双溪春尚好，也拟泛轻舟。只恐双溪舴艋舟，载不动许多愁。',
        '风停了，尘土里带有花的香气，花儿已凋落殆尽。日头已经升的老高，我却懒得来梳妆。'
            '景物依旧，人事已变，一切事情都已经完结。想要倾诉自己的感慨，还未开口，眼泪先流下来。\n'
            '听说双溪春景尚好，我也打算泛舟前去。只恐怕双溪蚱蜢般的小船，载不动我许多的忧愁。',
        '1003',
        3,
        4,
        'http://1803.img.pp.sohu.com.cn/images/2011/9/23/15/13/u132152629_133523e0812g214_b.jpg',
        userInfo: StructUserInfo('1003', '烛光里的愿',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279967-XmaBsxZSyf.jpg'),
      ),
      StructContentDetail(
        '1004',
        '一剪梅·红藕香残玉簟秋t',
        '红藕香残玉簟秋。轻解罗裳，独上兰舟。云中谁寄锦书来，雁字回时，月满西楼。\n'
            '花自飘零水自流。一种相思，两处闲愁。此情无计可消除，才下眉头，却上心头。',
        '荷已残，香已消，冷滑如玉的竹席，透出深深的凉秋。轻轻的脱下罗绸外裳，一个人独自躺上眠床。'
            '仰头凝望远天，那白云舒卷处，谁会将锦书寄来？正是雁群排成“人”字，一行行南归时候。月光皎洁浸人，洒满这西边独倚的亭楼。\n'
            '花，自顾地飘零，水，自顾地漂流。一种离别的相思，牵动起两处的闲愁。'
            '啊，无法排除的是——这相思，这离愁，刚从微蹙的眉间消失，又隐隐缠绕上了心头。',
        '1004',
        4,
        5,
        'http://1881.img.pp.sohu.com.cn/images/2011/9/23/15/13/u132152629_133523e08fcg215_b.jpg',
        userInfo: StructUserInfo('1004', '青丝茧',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279967-IAnVyPiRLK.jpg'),
      ),
      StructContentDetail(
        '1005',
        '如梦令·昨夜雨疏风骤',
        '昨夜雨疏风骤，浓睡不消残酒。试问卷帘人，却道海棠依旧。知否，知否？应是绿肥红瘦。',
        '昨天夜里雨点虽然稀疏，但是风却劲吹不停，我酣睡一夜，然而醒来之后依然觉得还有一点酒意没有消尽。'
            '于是就问正在卷帘的侍女，外面的情况如何，她只对我说：“海棠花依旧如故”。'
            '知道吗？知道吗？应是绿叶繁茂，红花凋零。',
        '1005',
        6,
        10,
        'http://1881.img.pp.sohu.com.cn/images/2011/9/23/15/11/u132152629_133523c2853g214_b.jpg',
        userInfo: StructUserInfo('1005', '如花的旋律',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279967-IAnVyPiRLK.jpg'),
      ),
      StructContentDetail(
        '1005',
        '水调歌头·明月几时有',
        '丙辰中秋，欢饮达旦，大醉，作此篇，兼怀子由。\n'
            ' 明月几时有？把酒问青天。\n',
        '丙辰中秋，欢饮达旦，大醉，作此篇，兼怀子由。\n'
            ' 明月几时有？把酒问青天。\n'
            '不知天上宫阙，今夕是何年。\n'
            '我欲乘风归去，又恐琼楼玉宇，高处不胜\n',
        '1006',
        7,
        10,
        'http://1841.img.pp.sohu.com.cn/images/2011/9/23/15/17/u132152629_133524196e2g215_b.jpg',
        userInfo: StructUserInfo('1006', '漫步云海涧',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279967-IAnVyPiRLK.jpg'),
      ),
      StructContentDetail(
        '1007',
        '燕子楼',
        '独思一夜情多少，地角天涯不是长。',
        '独思一夜情多少，地角天涯不是长。',
        '1007',
        13,
        42,
        'http://1841.img.pp.sohu.com.cn/images/2011/9/23/15/11/u132152629_133523c50bfg213_b.jpg',
        userInfo: StructUserInfo('1007', '阳光温暖空屋',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279967-XmaBsxZSyf.jpg'),
      ),
      StructContentDetail(
        '1008',
        '无题',
        '春心莫共花争发，一寸相思一寸灰。',
        '春心莫共花争发，一寸相思一寸灰。',
        '1008',
        24,
        53,
        'http://1873.img.pp.sohu.com.cn/images/2011/9/23/15/12/u132152629_133523c7e98g214_b.jpg',
        userInfo: StructUserInfo('1004', '地平线无际',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279967-IAnVyPiRLK.jpg'),
      ),
      StructContentDetail(
        '1009',
        '溪佚题',
        '多情自古空余恨，好梦右来最易醒。',
        '多情自古空余恨，好梦右来最易醒。',
        '1009',
        62,
        20,
        'http://1813.img.pp.sohu.com.cn/images/2011/9/23/15/13/u132152629_133523d6c28g214_b.jpg',
        userInfo: StructUserInfo('1005', '半颗心的暖',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279967-IAnVyPiRLK.jpg'),
      ),
      StructContentDetail(
        '1010',
        '寄人',
        '别梦依依到谢家，小廊回合曲阑斜。多情只有春庭月，犹为离人照落花。',
        '别梦依依到谢家，小廊回合曲阑斜。多情只有春庭月，犹为离人照落花。',
        '1010',
        7,
        10,
        'http://1873.img.pp.sohu.com.cn/images/2011/9/23/15/12/u132152629_133523c9072g215_b.jpg',
        userInfo: StructUserInfo('1006', '深渊的那支花',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279967-IAnVyPiRLK.jpg'),
      ),
    ];
  }

  /// 拉取用户关注的帖子列表
  List<StructContentDetail> getFollowList() {
    return [
      StructContentDetail(
        '1001',
        'hello test',
        'summary',
        'detail info',
        '1001',
        1,
        5,
        'http://image.biaobaiju.com/uploads/20180211/00/1518279967-XmaBsxZSyf.jpg',
        userInfo: StructUserInfo('1001', 'test',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279965-WhqyaQodpn.jpg'),
      ),
      StructContentDetail(
        '1002',
        'hello test',
        'summary',
        'detail info',
        '1001',
        1,
        6,
        'http://image.biaobaiju.com/uploads/20180211/00/1518279967-IAnVyPiRLK.jpg',
        userInfo: StructUserInfo('1002', 'test2',
            'http://image.biaobaiju.com/uploads/20180211/00/1518279965-WhqyaQodpn.jpg'),
      ),
    ];
  }
}
