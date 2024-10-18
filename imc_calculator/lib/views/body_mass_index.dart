import '../models/imc_type.dart';  

class BodyMassIndex {
  ImcData imcData;

  BodyMassIndex({required double weight, required double size})
      : imcData = ImcData() {
    imcData.weight = weight;
    imcData.size = size;
    _calculateImc();
  }

  void _calculateImc() {
    if (imcData.size > 0 && imcData.weight > 0) {
      imcData.imc = imcData.weight / ((imcData.size / 100) * (imcData.size / 100));
      _determineImcType();  
    }
  }

  void _determineImcType() {
    if (imcData.imc < 18.5) {
      imcData.imcType = ImcType.underweight;
      imcData.imcTypeText = 'Sous-poids';
    } else if (imcData.imc >= 18.5 && imcData.imc < 25) {
      imcData.imcType = ImcType.normal;
      imcData.imcTypeText = 'Normal';
    } else if (imcData.imc >= 25 && imcData.imc < 30) {
      imcData.imcType = ImcType.overweight;
      imcData.imcTypeText = 'Surpoids';
    } else {
      imcData.imcType = ImcType.obesity;
      imcData.imcTypeText = 'Obésité';
    }
  }

  String getImcResult() {
    return 'IMC : ${imcData.imc.toStringAsFixed(2)}';
  }

  String getImcTypeResult() {
    return 'Catégorie : ${imcData.imcTypeText}';
  }


}
