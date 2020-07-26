///
//  Generated code. Do not modify.
//  source: protos/user_info.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UserInfoRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('UserInfoRsp', createEmptyInstance: create)
        ..aOS(1, 'nickName', protoName: 'nickName')
        ..aOS(2, 'headerUrl', protoName: 'headerUrl')
        ..aOS(3, 'uid')
        ..hasRequiredFields = false;

  UserInfoRsp._() : super();
  factory UserInfoRsp() => create();
  factory UserInfoRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserInfoRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  UserInfoRsp clone() => UserInfoRsp()..mergeFromMessage(this);
  UserInfoRsp copyWith(void Function(UserInfoRsp) updates) =>
      super.copyWith((message) => updates(message as UserInfoRsp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserInfoRsp create() => UserInfoRsp._();
  UserInfoRsp createEmptyInstance() => create();
  static $pb.PbList<UserInfoRsp> createRepeated() => $pb.PbList<UserInfoRsp>();
  @$core.pragma('dart2js:noInline')
  static UserInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserInfoRsp>(create);
  static UserInfoRsp _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nickName => $_getSZ(0);
  @$pb.TagNumber(1)
  set nickName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNickName() => $_has(0);
  @$pb.TagNumber(1)
  void clearNickName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get headerUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set headerUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHeaderUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeaderUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}
