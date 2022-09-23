import 'package:conversormoedas/app/components/moeda_box.dart';
import 'package:conversormoedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toTexto = TextEditingController();

  final TextEditingController fromTexto = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toTexto: toTexto, fromTexto: fromTexto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 20, left: 30, right: 20, top: 20),
          child: ListView(children: [
            const SizedBox(height: 50),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset('assets/img/conversordemoedas.jpg',
                  width: 200, height: 200),
            ),
            const SizedBox(height: 50),
            MoedaBox(
                itens: homeController.moedas,
                onChanged: (model) {
                  setState(() {
                    homeController.toMoedas = model!;
                  });
                },
                controller: homeController.toTexto,
                selecionadoItem: homeController.toMoedas),
            const SizedBox(
              height: 20,
            ),
            MoedaBox(
              itens: homeController.moedas,
              onChanged: (model) {
                homeController.fromMoedas = model!;
              },
              controller: homeController.fromTexto,
              selecionadoItem: homeController.fromMoedas,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.grey),
                ),
                onPressed: () {
                  homeController.converte();
                },
                child: const Text("CONVERTER"))
          ]),
        ),
      ),
    );
  }
}
