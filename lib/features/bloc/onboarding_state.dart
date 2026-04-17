class OnboardingState {
  final double? weight;
  final bool isValid;

  const OnboardingState({
    this.weight,
    this.isValid = false,
  });

  OnboardingState copyWith({
    double? weight,
    bool? isValid,
  }) {
    return OnboardingState(
      weight: weight ?? this.weight,
      isValid: isValid ?? this.isValid,
    );
  }
}
