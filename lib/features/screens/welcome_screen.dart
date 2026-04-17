import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';
import 'components/body_weight_input.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  'assets/icon.png',
                  width: 48,
                  height: 68,
                ),
                const Text(
                  "iHydrate",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Start with iHydrate to record and track your water intake daily based on your needs and stay hydrated",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: 48),

                // Novo componente de peso integrado ao BLoC
                Builder(
                  builder: (context) {
                    return BodyWeightInput(
                      onChanged: (value) {
                        context.read<OnboardingBloc>().add(
                          WeightChanged(value),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 48),

                // Exemplo de botão acompanhando o estado de validação
                BlocBuilder<OnboardingBloc, OnboardingState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          disabledBackgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        // Só habilita se o peso for válido
                        onPressed: state.isValid
                            ? () {
                                context.read<OnboardingBloc>().add(
                                  SubmitOnboarding(),
                                );
                                // Lógica de navegação iria aqui, após o estado calcular
                                // ou ouvindo um BlocListener
                              }
                            : null,
                        child: const Text(
                          "Continuar",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
