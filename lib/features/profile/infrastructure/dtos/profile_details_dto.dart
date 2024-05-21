import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/profile_details.dart';

part 'profile_details_dto.freezed.dart';

part 'profile_details_dto.g.dart';

@Freezed(toJson: true)
class ProfileDetailsDto with _$ProfileDetailsDto {
  const factory ProfileDetailsDto({
    required String displayName,
    required String phoneNumber,
  }) = _ProfileDetailsDto;

  factory ProfileDetailsDto.fromDomain(ProfileDetails details) {
    return ProfileDetailsDto(
      displayName: details.displayName,
      phoneNumber: details.phoneNumber,
    );
  }
}
