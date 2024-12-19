import 'package:flutter/material.dart';
import '../../data/acordes.dart';

class MeuBody extends StatefulWidget {
  const MeuBody({Key? key}) : super(key: key);

  @override
  _MeuBodyState createState() => _MeuBodyState();
}

class _MeuBodyState extends State<MeuBody> {
  String? tomSelecionado;
  List<int> acordesSelecionadosIndices = [];

  @override
  Widget build(BuildContext context) {
    List<String> acordesDoTom = tomSelecionado != null ? obterAcordesDoTom(tomSelecionado!) : [];

    return Padding(
      padding: const EdgeInsets.all(0.0), //padding geral
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 0),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF154666),
              ),
            ),
          ),
          const SizedBox(height: 0),
          SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tons.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final tom = tons[index];
                final isSelected = tomSelecionado == tom;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0), // espaco da margem
                  child: ChoiceChip(
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Text(tom),
                    ),
                    selected: isSelected,
                    selectedColor: const Color(0xFF154666),
                    onSelected: (selected) {
                      setState(() {
                        tomSelecionado = selected ? tom : null;

                        if(tomSelecionado == null){
                          acordesSelecionadosIndices.clear();
                        }

                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    side: BorderSide(color: isSelected ? Colors.transparent : Colors.grey.shade200),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),
          if (tomSelecionado != null) ...[
            const SizedBox(height: 72),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                'Acordes para $tomSelecionado',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 8),

    Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 3), // Padding vertical reduzido
    child: Wrap(
    spacing: 4.0, // Espaçamento horizontal entre os botões
    runSpacing: 4.0, // Espaçamento vertical entre as linhas do Wrap
    children: List.generate(acordesDoTom.length, (index) {
    final acorde = acordesDoTom[index];
    final isSelected = acordesSelecionadosIndices.contains(index);

    return ElevatedButton(
    onPressed: () {
    setState(() {
    acordesSelecionadosIndices.add(index);
    });
    },
    style: ElevatedButton.styleFrom(
    backgroundColor:const Color(0xFF154666),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32), // Padding do botão ajustado
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
    ),
    elevation: 2,
    shadowColor: Colors.black12,
    ),
    child: Text(
    acorde,
    style: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    ),
    ),
    );
    }),
    ),
    ),

    const SizedBox(height: 42),
            Row(

              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      //color: const Color(0xFF154666),
                      borderRadius: BorderRadius.circular(0.0),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Alinha o Text à esquerda
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Text(
                                "Acordes Selecionados",
                                style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF154666),
                                ),
                                ),
                                Text( // Remove o SizedBox desnecessário
                                "",
                                style: TextStyle(
                                fontSize: 10,
                                ),
                                ),
                                ],
                                ),


                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Wrap(
                              spacing: 2,
                              children: acordesSelecionadosIndices.map((index) => Chip(label: Text(acordesDoTom[index]))).toList(),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),



          ] else
            const Expanded( // Centraliza verticalmente quando nenhum tom está selecionado
              child: Center(
                child: Text(
                  "Selecione um tom acima",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
