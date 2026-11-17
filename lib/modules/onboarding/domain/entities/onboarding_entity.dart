class OnboardingEntity {
  final String heading;
  final String description;
  final String imageUrl;

  OnboardingEntity({
    required this.heading,
    required this.description,
    required this.imageUrl,
  });

  OnboardingEntity copyWith({
    String? heading,
    String? description,
    String? imageUrl
  }) {
    return OnboardingEntity(
      heading: heading ?? this.heading,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl
    );
  }
}

