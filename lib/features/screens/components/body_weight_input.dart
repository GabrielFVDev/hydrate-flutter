import 'package:flutter/material.dart';

class BodyWeightInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const BodyWeightInput({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Body weight',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black,
                letterSpacing: -0.4,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: 'weight',
                hintStyle: TextStyle(
                  fontSize: 17,
                  color: Color(0xFFBBBBC1),
                  letterSpacing: -0.4,
                ),
                suffixText: 'Kg',
                suffixStyle: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  letterSpacing: -0.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
