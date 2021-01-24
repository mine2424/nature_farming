import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

import 'base.dart';

part 'user.flamingo.dart';

class User extends Base<User> {
  User({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @override
  CollectionReference get collectionRootReference =>
      super.collectionRootReference.doc('v1').collection('users');

  @Field()
  String name;

  @Field()
  String userId;

  /// プロフィール写真
  @StorageField()
  StorageFile image;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
