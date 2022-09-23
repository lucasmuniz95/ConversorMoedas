class MoedaModel {
  final String name;
  final double real;
  final double euro;
  final double dolar;
  final double bitcoin;

  MoedaModel(
      {required this.name,
      required this.real,
      required this.euro,
      required this.dolar,
      required this.bitcoin});

  static List<MoedaModel> getMoeda() {
    return <MoedaModel>[
      MoedaModel(
          name: 'Real', real: 1.0, dolar: 0.19, euro: 0.19, bitcoin: 0.00001),
      MoedaModel(
          name: 'Euro', real: 5.28, dolar: 1.0, euro: 1.0, bitcoin: 0.000054),
      MoedaModel(
          name: 'Dolar', real: 5.28, dolar: 1.0, euro: 1.0, bitcoin: 0.000054),
      MoedaModel(
          name: 'Bitcoin',
          real: 97882.4,
          dolar: 18628.3,
          euro: 18653.45,
          bitcoin: 1.0),
    ];
  }
}
