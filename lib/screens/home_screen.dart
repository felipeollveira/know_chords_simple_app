import 'package:flutter/material.dart';
import '../../data/acordes.dart';
import '../widgets/seletor_tom.dart';
import '../widgets/lista_acordes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? tomSelecionado;
  List<String> acordesSelecionados = [];

  @override
  Widget build(BuildContext context) {
    // CORREÇÃO: Converte explicitamente a lista de dynamic para List<String>.
    final acordesDoTom = tomSelecionado != null
        ? List<String>.from(obterAcordesDoTom(tomSelecionado!))
        : <String>[];

    return Scaffold( // Adicionado Scaffold para um fundo padrão e melhor estrutura.
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bem-vindo 👋",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Descubra seus acordes favoritos",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF154666),
                ),
              ),
              const SizedBox(height: 24),

              // Card azul no topo com design aprimorado
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF154666), Color(0xFF1F6BB2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF154666), // Sombra um pouco mais visível
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "Selecione um tom e explore seus acordes!",
                        style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4), // Altura de linha melhorada
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.music_note_rounded, color: Colors.white, size: 40),
                  ],
                ),
              ),

              const SizedBox(height: 28),
              const Text(
                "Tons disponíveis",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF154666)),
              ),
              const SizedBox(height: 16),

              SeletorTom(
                tomSelecionado: tomSelecionado,
                onSelecionar: (novoTom) {
                  setState(() {
                    // Se o mesmo tom for selecionado, desmarca. Senão, seleciona o novo.
                    tomSelecionado = tomSelecionado == novoTom ? null : novoTom;
                    acordesSelecionados.clear();
                  });
                },
              ),

              // MELHORIA: Animação para a aparição da seção de acordes
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      axisAlignment: -1.0,
                      child: child,
                    ),
                  );
                },
                child: tomSelecionado != null
                    ? Column(
                  key: ValueKey(tomSelecionado), // Chave para o AnimatedSwitcher funcionar corretamente
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      "Acordes no tom de $tomSelecionado",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF154666)),
                    ),
                    const SizedBox(height: 12),
                    ListaAcordes(
                      acordes: acordesDoTom,
                      onSelecionar: (acorde) {
                        setState(() {
                          if (!acordesSelecionados.contains(acorde)) {
                            acordesSelecionados.add(acorde);
                          }
                        });
                      },
                    ),
                  ],
                )
                    : const SizedBox.shrink(key: ValueKey('empty')), // Widget vazio quando nada está selecionado
              ),
            ],
          ),
        ),
      ),
    );
  }
}
