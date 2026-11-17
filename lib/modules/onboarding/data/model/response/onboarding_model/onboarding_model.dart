import 'package:fitness_app/modules/onboarding/domain/entities/onboarding_entity.dart';

class OnboardingModel {
  final String? heading;
  final String? description;
  final String? imageUrl;

  OnboardingModel({this.heading, this.description, this.imageUrl});

  factory OnboardingModel.fromJson(Map<String, dynamic> json) =>
      OnboardingModel(
        imageUrl: json['imageurl'] as String?,
        heading: json['heading'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'heading': heading,
    'description': description,
    'imageurl': imageUrl,
  };

  OnboardingEntity toEntity() {
    return OnboardingEntity(
      heading: heading ?? '',
      description: description ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}
