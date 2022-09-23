import 'package:conversormoedas/app/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toTexto = TextEditingController();
  final TextEditingController fromTexto = TextEditingController();
  final homeControler = HomeController(toTexto: toTexto, fromTexto: fromTexto);

  test('Deve converte de real para dolar', () {
    toTexto.text = '2,0';
    homeControler.converte();
    expect(fromTexto.text, '0.38');
  });
}
