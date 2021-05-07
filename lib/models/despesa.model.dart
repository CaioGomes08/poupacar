class Despesa {
  int id = 0;
  double totalAbastecido;
  double totalLitros;
  String data;

  Despesa({
    this.id,
    this.totalAbastecido,
    this.totalLitros,
    this.data,
  });

  Despesa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalAbastecido = double.parse(json['totalAbastecido']);
    totalLitros = double.parse(json['totalLitros']);
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['totalAbastecido'] = this.totalAbastecido;
    data['totalLitros'] = this.totalLitros;
    data['data'] = this.data.toString().substring(0, 10);
    return data;
  }
}
