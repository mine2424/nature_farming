// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum UserKey {
  name,
  userId,
  content,
  fmcToken,

  userImage,
}

extension UserKeyExtension on UserKey {
  String get value {
    switch (this) {
      case UserKey.name:
        return 'name';
      case UserKey.userId:
        return 'userId';
      case UserKey.content:
        return 'content';
      case UserKey.fmcToken:
        return 'fmcToken';
      case UserKey.userImage:
        return 'userImage';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(User doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'userId', doc.userId);
  Helper.writeNotNull(data, 'content', doc.content);
  Helper.writeNotNull(data, 'fmcToken', doc.fmcToken);

  Helper.writeStorageNotNull(data, 'userImage', doc.userImage, isSetNull: true);

  return data;
}

/// For load data
void _$fromData(User doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String>(data, 'name');
  doc.userId = Helper.valueFromKey<String>(data, 'userId');
  doc.content = Helper.valueFromKey<String>(data, 'content');
  doc.fmcToken = Helper.valueFromKey<String>(data, 'fmcToken');

  doc.userImage = Helper.storageFile(data, 'userImage');
}
