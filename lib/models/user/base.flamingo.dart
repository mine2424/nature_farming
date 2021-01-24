// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum BaseKey {
  domain,
}

extension BaseKeyExtension on BaseKey {
  String get value {
    switch (this) {
      case BaseKey.domain:
        return 'domain';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Base doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'domain', doc.domain);

  return data;
}

/// For load data
void _$fromData(Base doc, Map<String, dynamic> data) {
  doc.domain = Helper.valueFromKey<String>(data, 'domain');
}
