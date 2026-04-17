import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<WeightChanged>(_onWeightChanged);
    on<SubmitOnboarding>(_onSubmit);
  }

  void _onWeightChanged(WeightChanged event, Emitter<OnboardingState> emit) {
    // Tenta converter o texto digitado (ex: "70.5" ou "70,5") para double
    final sanitizedStr = event.weightStr.replaceAll(',', '.');
    final weight = double.tryParse(sanitizedStr);

    // Validação simples: o peso deve ser maior que 0
    final isValid = weight != null && weight > 0;

    emit(
      state.copyWith(
        weight: weight,
        isValid: isValid,
      ),
    );
  }

  void _onSubmit(SubmitOnboarding event, Emitter<OnboardingState> emit) {
    if (!state.isValid || state.weight == null) return;

    // Aqui você faria o cálculo.
    // Ex: 35ml de água por Kg
    final dailyWaterGoal = state.weight! * 35;

    // TODO: Salvar no banco de dados, SharedPreferences ou emitir um estado de "Sucesso"
  }
}
