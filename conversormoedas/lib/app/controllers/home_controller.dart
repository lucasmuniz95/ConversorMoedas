import 'package:conversormoedas/app/models/moeda_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<MoedaModel> moedas;
  final TextEditingController toTexto;
  final TextEditingController fromTexto;
  late MoedaModel toMoedas;
  late MoedaModel fromMoedas;

  HomeController({required this.toTexto, required this.fromTexto}) {
    moedas = MoedaModel.getMoeda();
    toMoedas = moedas[0];
    fromMoedas = moedas[1];
  }

  void converte() {
    String texto = toTexto.text;
    double value = double.tryParse(texto.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    if (fromMoedas.name == 'Real') {
      returnValue = value * toMoedas.real;
    } else if (fromMoedas.name == 'Dolar') {
      returnValue = value * toMoedas.dolar;
    } else if (fromMoedas.name == 'Euro') {
      returnValue = value * toMoedas.euro;
    } else if (fromMoedas.name == 'Bitcoin') {
      returnValue = value * toMoedas.bitcoin;
    }

    fromTexto.text = returnValue.toStringAsFixed(2);
  }
}
