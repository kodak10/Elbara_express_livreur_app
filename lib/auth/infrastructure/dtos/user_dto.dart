import 'package:firebase_auth/firebase_auth.dart' as f_auth;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/user.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

// TODO(Ahmed): extend User entity when extending another Freezed class is supported:
// https://github.com/rrousselGit/freezed/issues/907
@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    required String email,
    required String? displayName,
    required String? phoneNumber,
    required String? photoUrl,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  factory UserDto.fromUserCredential(f_auth.User user) {
    return UserDto(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName?.split(' ').first ?? '',
      phoneNumber: user.phoneNumber ?? '',
      photoUrl: user.photoURL ?? '',
    );
  }

  factory UserDto.fromDomain(User user) {
    return UserDto(
      id: user.id,
      email: user.email,
      displayName: user.displayName,
      phoneNumber: user.phoneNumber,
      photoUrl: user.photoUrl,
    );
  }

  User toDomain() {
    return User(
      id: id,
      email: email,
      displayName: displayName,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
    );
  }
}
