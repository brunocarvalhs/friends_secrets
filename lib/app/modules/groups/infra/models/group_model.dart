import 'dart:convert';

import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';

import '../../domain/entities/logged_group.dart';
import '../../domain/entities/logged_group_info.dart';

class GroupModel extends LoggedGroup implements LoggedGroupInfo {
  const GroupModel({
    String? id,
    TypeModel? type,
    String? name,
    String? description,
    String? date,
    double? priceMin,
    double? priceMax,
    UserModel? author,
    List<UserModel>? users,
    DateTime? created,
    DateTime? updated,
  }) : super(
          id: id,
          type: type,
          name: name,
          description: description,
          date: date,
          priceMin: priceMin,
          priceMax: priceMax,
          author: author,
          users: users,
          created: created,
          updated: updated,
        );

  @override
  GroupModel copyWith({
    String? id,
    TypeModel? type,
    String? name,
    String? description,
    String? date,
    double? priceMin,
    double? priceMax,
    UserModel? author,
    List<UserModel>? users,
    DateTime? created,
    DateTime? updated,
  }) {
    return GroupModel(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      description: description ?? this.description,
      date: date ?? this.date,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      author: author,
      users: users ?? this.users,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "type": type?.toMap(),
      "name": name,
      "description": description,
      "date": date,
      "priceMin": priceMin,
      "priceMax": priceMax,
      "author": author?.toMap(),
      'users': users?.map((x) => x.toMap()).toList(),
      "createdAt": created?.toIso8601String(),
      "updatedAt": updated?.toIso8601String(),
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id: map["id"] as String,
      type: map['type'] != null ? TypeModel.fromMap(map['type']) : null,
      name: map["name"] as String,
      description: map["description"] as String?,
      date: map["date"] as String?,
      priceMin: map["priceMin"] as double?,
      priceMax: map["priceMax"] as double?,
      author: map['author'] != null ? UserModel.fromMap(map['author']) : null,
      users: map['users'] != null ? List<UserModel>.from(map['users']?.map((x) => UserModel.fromMap(x))) : null,
      created: map["createdAt"] != null ? DateTime.parse(map["createdAt"] as String) : null,
      updated: map["updatedAt"] != null ? DateTime.parse(map["updatedAt"] as String) : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory GroupModel.fromJson(String source) => GroupModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
