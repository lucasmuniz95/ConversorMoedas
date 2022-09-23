// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:conversormoedas/app/models/moeda_model.dart';

class MoedaBox extends StatelessWidget {
  final List<MoedaModel> itens;
  final MoedaModel selecionadoItem;
  final TextEditingController controller;
  final void Function(MoedaModel?)? onChanged;

  const MoedaBox({
    Key? key,
    required this.itens,
    required this.controller,
    required this.onChanged,
    required this.selecionadoItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 56,
              child: DropdownButton<MoedaModel>(
                isExpanded: true,
                value: selecionadoItem,
                iconEnabledColor: Colors.grey,
                underline: Container(height: 1, color: Colors.grey),
                items: itens
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                    .toList(),
                onChanged: onChanged,
              ),
            )),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 3,
          child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)))),
        )
      ],
    );
  }
}
