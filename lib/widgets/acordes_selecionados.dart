import 'package:flutter/material.dart';

class AcordesSelecionados extends StatelessWidget {
  final List<String> acordesSelecionados;

  const AcordesSelecionados({Key? key, required this.acordesSelecionados})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (acordesSelecionados.isEmpty) {
      return const Text(
        "Nenhum acorde selecionado ainda.",
        style: TextStyle(color: Colors.black38, fontSize: 13),
      );
    }

    return Wrap(
      spacing: 6,
      children: acordesSelecionados
          .map((acorde) => Chip(
        label: Text(
          acorde,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xFFE8F0F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ))
          .toList(),
    );
  }
}
