sealed class OnboardingEvent {}

class WeightChanged extends OnboardingEvent {
  final String weightStr;
  WeightChanged(this.weightStr);
}

class SubmitOnboarding extends OnboardingEvent {}
