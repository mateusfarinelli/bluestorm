class Drug {
  String name;
  String typeDescription;
  String coverage;
  String dosage;
  String gpi2;
  String gpi4;
  String gpi12;
  double strength;
  String strengthUnit;
  String type;
  String otcRxIndicator;

  Drug(
      {this.name,
      this.typeDescription,
      this.coverage,
      this.dosage,
      this.gpi2,
      this.gpi4,
      this.gpi12,
      this.strength,
      this.strengthUnit,
      this.type,
      this.otcRxIndicator});

  Drug.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    typeDescription = json['type_description'];
    coverage = json['coverage'];
    dosage = json['dosage'];
    gpi2 = json['gpi2'];
    gpi4 = json['gpi4'];
    gpi12 = json['gpi12'];
    strength = json['strength'];
    strengthUnit = json['strength_unit'];
    type = json['type'];
    otcRxIndicator = json['otc_rx_indicator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type_description'] = this.typeDescription;
    data['coverage'] = this.coverage;
    data['dosage'] = this.dosage;
    data['gpi2'] = this.gpi2;
    data['gpi4'] = this.gpi4;
    data['gpi12'] = this.gpi12;
    data['strength'] = this.strength;
    data['strength_unit'] = this.strengthUnit;
    data['type'] = this.type;
    data['otc_rx_indicator'] = this.otcRxIndicator;
    return data;
  }
}