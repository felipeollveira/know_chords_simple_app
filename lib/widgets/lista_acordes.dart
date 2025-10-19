import 'package:flutter/material.dart';

class ListaAcordes extends StatelessWidget {
  final List<String> acordes;
  final Function(String) onSelecionar;

  const ListaAcordes({Key? key, required this.acordes, required this.onSelecionar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: acordes.map((acorde) {
          return InkWell(
            onTap: () => onSelecionar(acorde),
            borderRadius: BorderRadius.circular(16),
            splashColor: Colors.blue.withOpacity(0.2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.music_note_rounded, color: Color(0xFF154666), size: 18),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      acorde,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF154666),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
