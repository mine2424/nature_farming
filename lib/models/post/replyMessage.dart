import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'replyMessage.flamingo.dart';

class ReplyMessage extends Document<ReplyMessage> {
  ReplyMessage({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
    CollectionReference collectionRef,
  }) : super(
            id: id,
            snapshot: snapshot,
            values: values,
            collectionRef: collectionRef);

  // @override
  // CollectionReference get collectionRootReference =>
  //     rootReference.collection('replyMessage');

  @Field()
  String name;

  @Field()
  String userId;

  @Field()
  String userImage;

  @Field()
  String content;

  @Field()
  int good;

  @Field()
  String fmcToken;

  /// プロフィール写真
  @StorageField()
  StorageFile postImage;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
