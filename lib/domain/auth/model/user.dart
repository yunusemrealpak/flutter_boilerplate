import 'package:busenet/busenet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User extends BaseEntity<User> with _$User {
  const factory User({
    String? id,
    String? name,
    String? email,
    String? password,
    String? token,
  }) = _User;
  const User._();
  factory User.initial() => const User();
  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  @override
  User fromJson(dynamic data) {
    return User.fromJson(data as Map<String, dynamic>);
  }
}
