import 'package:flutter_test/flutter_test.dart';
import 'package:imc_calculator/views/body_mass_index.dart';

void main() {
  group('BodyMassIndex', () {
    test('calculates IMC and category correctly', () {
      double weight = 70;  
      double size = 170;   

      BodyMassIndex bmi = BodyMassIndex(weight: weight, size: size);  
      expect(bmi.imcData.imc, closeTo(24.22, 0.01));  
      expect(bmi.imcData.imcTypeText, equals('Normal'));  
    });

    test('handles normal category', () {
      
    });

    test('handles underweight category', () {
      double weight = 50;
      double size = 180;

      BodyMassIndex bmi = BodyMassIndex(weight: weight, size: size);

      expect(bmi.imcData.imc, closeTo(15.43, 0.01));
      expect(bmi.imcData.imcTypeText, equals('Sous-poids'));
    });

    test('handles overweight category', () {
      double weight = 80;
      double size = 170;

      BodyMassIndex bmi = BodyMassIndex(weight: weight, size: size);

      expect(bmi.imcData.imc, closeTo(27.68, 0.01));
      expect(bmi.imcData.imcTypeText, equals('Surpoids'));
    });

    test('handles obesity category', () {
      double weight = 120;
      double size = 170;

      BodyMassIndex bmi = BodyMassIndex(weight: weight, size: size);

      expect(bmi.imcData.imc, closeTo(41.52, 0.01));
      expect(bmi.imcData.imcTypeText, equals('Obésité'));
    });
  });
}
