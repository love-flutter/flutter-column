import 'package:two_you_friend/util/struct/user_info.dart';

/// 用户私信消息
///
/// {
//    "id":"1001",
//    "userInfo":{
//        "uid":"1005",
//        "nickName":"如花的旋律",
//        "headerUrl":"https://pic4.zhimg.com/80/v2-5b65bdeaa315d1504142f927c3b8ba40_1440w.jpg"
//    },
//    "messageInfo":"你存在我深深的脑海里",
//    "messageTime":1595557026,
//    "isRead":false,
//    "unReadNum":2
//}
class StructUserMessage {
  /// 消息 id
  final String id;

  /// 用户信息
  final StructUserInfo userInfo;

  /// 消息内容
  final String messageInfo;

  /// 最后发送时间
  final int messageTime;

  /// 是否已读
  final bool isRead;

  /// 未读数量
  final int unReadNum;

  /// 默认构造函数
  const StructUserMessage(this.id, this.userInfo, this.messageInfo,
      this.messageTime, this.isRead, this.unReadNum);

  /// 将json数据转化为对象数据
  StructUserMessage.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        userInfo =
            StructUserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
        messageInfo = json['messageInfo'] as String,
        messageTime = json['messageTime'] as int,
        isRead = json['isRead'] as bool,
        unReadNum = json['unReadNum'] as int;

  /// 将对象转化为json数据
  static Map<String, dynamic> toJson(StructUserMessage userMessage) => {
        'id': userMessage.id,
        'userInfo': userMessage.userInfo,
        'messageInfo': userMessage.messageInfo,
        'messageTime': userMessage.messageTime,
        'isRead': userMessage.isRead,
        'unReadNum': userMessage.unReadNum
      };
}

/// 用户评论消息
/// {
//    "id":"1001",
//    "userInfo":{
//        "uid":"1007",
//        "nickName":"阳光温暖空屋",
//        "headerUrl":"http://image.biaobaiju.com/uploads/20180211/00/1518279967-XmaBsxZSyf.jpg"
//    },
//    "contentId":"1001",
//    "messageInfo":"不知道这样是不是对的",
//    "messageTime":1595557026,
//    "isRead":false
//}
class StructCommentMessage {
  /// 消息 id
  final String id;

  /// 用户信息
  final StructUserInfo userInfo;

  /// 关联贴子
  final String contentId;

  /// 消息内容
  final String messageInfo;

  /// 最后发送时间
  final int messageTime;

  /// 是否已读
  final bool isRead;

  /// 默认构造函数
  const StructCommentMessage(this.id, this.userInfo, this.messageInfo,
      this.messageTime, this.isRead, this.contentId);

  /// 将json数据转化为对象数据
  StructCommentMessage.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        userInfo =
            StructUserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
        messageInfo = json['messageInfo'] as String,
        messageTime = json['messageTime'] as int,
        isRead = json['isRead'] as bool,
        contentId = json['contentId'] as String;

  /// 将对象转化为json数据
  static Map<String, dynamic> toJson(StructCommentMessage commentMessage) => {
        'id': commentMessage.id,
        'userInfo': commentMessage.userInfo,
        'messageInfo': commentMessage.messageInfo,
        'messageTime': commentMessage.messageTime,
        'isRead': commentMessage.isRead,
        'contentId': commentMessage.contentId
      };
}
