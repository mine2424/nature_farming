// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replyMessage.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum ReplyMessageKey {
  name,
  userId,
  content,
  good,
  fmcToken,

  postImage,
}

extension ReplyMessageKeyExtension on ReplyMessageKey {
  String get value {
    switch (this) {
      case ReplyMessageKey.name:
        return 'name';
      case ReplyMessageKey.userId:
        return 'userId';
      case ReplyMessageKey.content:
        return 'content';
      case ReplyMessageKey.good:
        return 'good';
      case ReplyMessageKey.fmcToken:
        return 'fmcToken';
      case ReplyMessageKey.postImage:
        return 'postImage';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(ReplyMessage doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'userId', doc.userId);
  Helper.writeNotNull(data, 'content', doc.content);
  Helper.writeNotNull(data, 'good', doc.good);
  Helper.writeNotNull(data, 'fmcToken', doc.fmcToken);

  Helper.writeStorageNotNull(data, 'postImage', doc.postImage, isSetNull: true);

  return data;
}

/// For load data
void _$fromData(ReplyMessage doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String>(data, 'name');
  doc.userId = Helper.valueFromKey<String>(data, 'userId');
  doc.content = Helper.valueFromKey<String>(data, 'content');
  doc.good = Helper.valueFromKey<int>(data, 'good');
  doc.fmcToken = Helper.valueFromKey<String>(data, 'fmcToken');

  doc.postImage = Helper.storageFile(data, 'postImage');
}
