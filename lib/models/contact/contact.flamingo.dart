// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum ContactKey {
  name,
  userId,
  content,
}

extension ContactKeyExtension on ContactKey {
  String get value {
    switch (this) {
      case ContactKey.name:
        return 'name';
      case ContactKey.userId:
        return 'userId';
      case ContactKey.content:
        return 'content';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Contact doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'userId', doc.userId);
  Helper.writeNotNull(data, 'content', doc.content);

  return data;
}

/// For load data
void _$fromData(Contact doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String>(data, 'name');
  doc.userId = Helper.valueFromKey<String>(data, 'userId');
  doc.content = Helper.valueFromKey<String>(data, 'content');
}
