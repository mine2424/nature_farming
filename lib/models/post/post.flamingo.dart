// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum PostKey {
  name,
  userId,
  userImage,
  content,
  good,
  fmcToken,

  postImage,
  imageDate,
  replyMessage,
}

extension PostKeyExtension on PostKey {
  String get value {
    switch (this) {
      case PostKey.name:
        return 'name';
      case PostKey.userId:
        return 'userId';
      case PostKey.userImage:
        return 'userImage';
      case PostKey.content:
        return 'content';
      case PostKey.good:
        return 'good';
      case PostKey.fmcToken:
        return 'fmcToken';
      case PostKey.postImage:
        return 'postImage';
      case PostKey.imageDate:
        return 'imageDate';
      case PostKey.replyMessage:
        return 'replyMessage';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Post doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'userId', doc.userId);
  Helper.writeNotNull(data, 'userImage', doc.userImage);
  Helper.writeNotNull(data, 'content', doc.content);
  Helper.writeNotNull(data, 'good', doc.good);
  Helper.writeNotNull(data, 'fmcToken', doc.fmcToken);

  Helper.writeStorageNotNull(data, 'postImage', doc.postImage, isSetNull: true);
  Helper.writeStorageNotNull(data, 'imageDate', doc.imageDate, isSetNull: true);

  return data;
}

/// For load data
void _$fromData(Post doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String>(data, 'name');
  doc.userId = Helper.valueFromKey<String>(data, 'userId');
  doc.userImage = Helper.valueFromKey<String>(data, 'userImage');
  doc.content = Helper.valueFromKey<String>(data, 'content');
  doc.good = Helper.valueFromKey<int>(data, 'good');
  doc.fmcToken = Helper.valueFromKey<Future<String>>(data, 'fmcToken');

  doc.postImage = Helper.storageFile(data, 'postImage');
  doc.imageDate = Helper.storageFile(data, 'imageDate');
}
