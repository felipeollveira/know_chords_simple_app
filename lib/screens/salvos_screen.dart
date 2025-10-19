import 'package:flutter/material.dart';

class SalvosScreen extends StatelessWidget {
  const SalvosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> acordesSalvos = []; // Pode vir do estado global futuramente

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: acordesSalvos.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bookmark_outline, size: 80, color: Colors.grey.shade400),
              const SizedBox(height: 16),
              Text(
                "Nenhum acorde salvo ainda.",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
              ),
            ],
          ),
        )
            : Wrap(
          spacing: 8,
          children: acordesSalvos.map((a) => Chip(label: Text(a))).toList(),
        ),
      ),
    );
  }
}
