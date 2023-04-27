// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      todoId: json['todoId'] as String,
      userId: json['userId'] as String,
      teamId: json['teamId'] as String,
      title: json['title'] as String,
      isDone: json['isDone'] as bool,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'todoId': instance.todoId,
      'userId': instance.userId,
      'teamId': instance.teamId,
      'title': instance.title,
      'isDone': instance.isDone,
      'createdAt': instance.createdAt,
    };
