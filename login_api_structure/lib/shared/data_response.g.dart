// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse<TModel> _$DataResponseFromJson<TModel>(
  Map<String, dynamic> json,
  TModel Function(Object? json) fromJsonTModel,
) =>
    DataResponse<TModel>(
      success: (json['success'] as num?)?.toInt(),
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      body: _$nullableGenericFromJson(json['body'], fromJsonTModel),
    );

Map<String, dynamic> _$DataResponseToJson<TModel>(
  DataResponse<TModel> instance,
  Object? Function(TModel value) toJsonTModel,
) =>
    <String, dynamic>{
      if (instance.success case final value?) 'success': value,
      if (instance.code case final value?) 'code': value,
      if (instance.message case final value?) 'message': value,
      if (_$nullableGenericToJson(instance.body, toJsonTModel)
          case final value?)
        'body': value,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
