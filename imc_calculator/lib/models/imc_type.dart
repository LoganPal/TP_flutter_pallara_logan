enum ImcType {
  underweight,
  normal,
  overweight,
  obesity,
}

class ImcData {
  
  double weight = 0.0;
  double size = 0.0;
  double imc = 0;
  ImcType imcType = ImcType.normal;
  var imcTypeText = '';
}

