import 'package:flutter/material.dart';
import '../data/acordes.dart';

class SeletorTom extends StatelessWidget {
  final String? tomSelecionado;
  final Function(String?) onSelecionar;

  const SeletorTom({Key? key, required this.tomSelecionado, required this.onSelecionar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tons.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final tom = tons[index];
          final isSelected = tomSelecionado == tom;

          return GestureDetector(
            onTap: () => onSelecionar(isSelected ? null : tom),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              width: 80,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: isSelected
                    ? const LinearGradient(
                  colors: [Color(0xFF0D3B66), Color(0xFF154666)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                    : null,
                color: isSelected ? null : Colors.white,
                border: Border.all(color: isSelected ? Colors.transparent : Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: isSelected ? 10 : 4,
                    offset: Offset(0, isSelected ? 4 : 2),
                  ),
                ],
              ),
              child: Center(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: isSelected ? 18 : 16,
                  ),
                  child: Text(
                    tom,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
