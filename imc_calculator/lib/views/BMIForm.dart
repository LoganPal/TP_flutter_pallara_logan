import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'body_mass_index.dart';

class BMIForm extends StatefulWidget {
  const BMIForm({super.key});

  final String title = 'Calculez votre IMC';

  @override
  _BMIFormState createState() => _BMIFormState();
}

class _BMIFormState extends State<BMIForm> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  String _result = '';  
  String _category = '';  
  double _gaugeValue = 0.0;  

  void _calculateIMC() {
    setState(() {
      double weight = double.tryParse(_weightController.text) ?? 0.0;
      double size = double.tryParse(_sizeController.text) ?? 0.0;

      if (weight <= 0 || size <= 0 || weight > 500 || size > 250) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erreur'),
              content: Text('Tu es un camion !!!'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        BodyMassIndex bmi = BodyMassIndex(weight: weight, size: size);
        _result = bmi.getImcResult();
        _category = bmi.getImcTypeResult();
        _gaugeValue = bmi.imcData.imc;  
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Entrez votre poids en kg',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _sizeController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Entrez votre taille en cm',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),  
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 40, 
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 18.5,
                      color: Colors.blue,
                      label: 'Sous-poids',
                    ),
                    GaugeRange(
                      startValue: 18.5,
                      endValue: 25,
                      color: Colors.green,
                      label: 'Normal',
                    ),
                    GaugeRange(
                      startValue: 25,
                      endValue: 30,
                      color: Colors.orange,
                      label: 'Surpoids',
                    ),
                    GaugeRange(
                      startValue: 30,
                      endValue: 40,
                      color: Colors.red,
                      label: 'Obésité',
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: _gaugeValue,  
                      enableAnimation: true,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      positionFactor: 0.2,
                      angle: 90,
                      widget: Text(
                        'IMC',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateIMC, 
              child: Text('Calculer IMC'),
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              _category,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
