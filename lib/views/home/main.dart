import 'package:flutter/material.dart';
import '../.././data/acordes.dart';

class MeuBody extends StatefulWidget {
  const MeuBody({Key? key}) : super(key: key);

  @override
  State<MeuBody> createState() => _MeuBodyState();
}
class _MeuBodyState extends State<MeuBody> {
  String? tomSelecionado;
  List<String> acordesSelecionados = [];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecione o Tom ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF154666),
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tons.length,
              itemBuilder: (context, index) {
                final tom = tons[index];
                final isSelected = tomSelecionado == tom;

                return ChoiceChip(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Text(tom),
                  ),

                  selected: isSelected,
                  selectedColor: const Color(0xFF154666),
                  onSelected: (selected) {
                    setState(() {
                      tomSelecionado = selected ? tom : null;
                      acordesSelecionados = [];
                    });
                  },

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  side: BorderSide(color: isSelected ? Colors.transparent : Colors.grey.shade300),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          ),

        ],
      ),
    );
  }
}

