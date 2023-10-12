import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*late*/ double?
      _numberForm; //late serve para corrigir o erro de inicialização, ou pode-se criar um construtor? - Deu erro colocar o late. A variável não é inicializada, colocando o ponto de interrogação indica que esta variável é passível de ser nula
  String? valorInicial;
  String? valorConvertido;
  String? mesgConversao;

  final List<String> medidas = [
    'Milímetros',
    'Centímetros',
    'Metros',
    'Quilômetros',
    'Miligramas',
    'Centigramas',
    'Gramas',
    'Quilogramas',
    'Horas',
    'Minutos',
    'Segundos',
  ];
  final Map<String, int> medidasMap = {
    'Milímetros': 0,
    'Centímetros': 1,
    'Metros': 2,
    'Quilômetros': 3,
    'Miligramas': 4,
    'Centigramas': 5,
    'Gramas': 6,
    'Quilogramas': 7,
    'Horas': 8,
    'Minutos': 9,
    'Segundos': 10,
  };

  final dynamic formulasConversao = {
    '0': [1, 0.1, 0.001, 0.000001, 0, 0, 0, 0, 0, 0, 0],
    '1': [10, 1, 0.01, 0.00001, 0, 0, 0, 0, 0, 0, 0],
    '2': [1000, 100, 1, 0.001, 0, 0, 0, 0, 0, 0, 0],
    '3': [1000000, 100000, 1000, 1, 0, 0, 0, 0, 0, 0, 0],
    '4': [0, 0, 0, 0, 1, 0.1, 0.001, 0.000001, 0, 0, 0],
    '5': [0, 0, 0, 0, 10, 1, 0.01, 0.00001, 0, 0],
    '6': [0, 0, 0, 0, 1000, 100, 1, 0.001, 0, 0, 0],
    '7': [0, 0, 0, 0, 1000000, 100000, 1000, 1, 0, 0, 0],
    '8': [0, 0, 0, 0, 0, 0, 0, 0, 1, 60, 3600],
    '9': [0, 0, 0, 0, 0, 0, 0, 0, 0.001666667, 1, 60],
    '10': [0, 0, 0, 0, 0, 0, 0, 0, 0.0002777778, 0.0166667, 1]
  };

  void conversao(double medidas, String De, String Para) {
    int? nDe = medidasMap[De];
    int? nPara = medidasMap[Para];
    var fatorConversao = formulasConversao[nDe.toString()][nPara];
    double resultado = medidas * fatorConversao;
    String msg = "";
    if (resultado == 0) {
      msg = 'O valor não pode ser convertido';
    } else {
      var medidasForm = _numberForm.toString();
      var valorI = valorInicial;
      var resultadoStr = resultado.toString();
      var medidaConvertida = valorConvertido;
      msg = '$medidasForm $valorI é $resultadoStr $medidaConvertida';
    }
    setState(() {
      mesgConversao = msg;
    });
  }

  @override
  void initState() {
    _numberForm = 0;
    super.initState();
  }

  DropdownMenuItem dropDowCreate(String medidas) {
    return DropdownMenuItem(value: medidas, child: Text(medidas));
  }

  @override
  Widget build(BuildContext context) {
    //formatação do dropbox
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color: Colors.blue[900],
    );

    final TextStyle labelStyle = TextStyle(
      fontSize: 20,
      color: Colors.grey[900],
    );

    return MaterialApp(
      title: 'Conversor de Unidades',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Conversor de Unidades'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //TextFild - input usuário
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Valor',
                style: labelStyle,
              ),
              const Spacer(),
              TextField(
                style: inputStyle,
                decoration: const InputDecoration(
                  hintText: 'Digite o valor a ser convertido',
                ),
                //propriedade do TextFild - evento (mudança)
                onChanged: (text) {
                  var valorInput = double.tryParse(text);
                  print(valorInput);
                  if (valorInput != null) {
                    setState(() {
                      _numberForm = valorInput;
                    });
                  }
                },
              ),
              const Spacer(),
              Text(
                'De',
                style: labelStyle,
              ),
              DropdownButton(
                value: valorInicial,
                items: medidas.map(dropDowCreate).toList(),
                isExpanded: true,
                onChanged: (medidas) {
                  setState(() {
                    valorInicial = medidas;
                  });
                },
              ),
              //Text((_numberForm == null) ? '' : _numberForm.toString()),
              const Spacer(),
              Text(
                'Para',
                style: labelStyle,
              ),
              DropdownButton(
                value: valorConvertido,
                items: medidas.map(dropDowCreate).toList(),
                isExpanded: true,
                onChanged: (medidas) {
                  setState(() {
                    valorConvertido = medidas;
                  });
                },
              ),
              const Spacer(
                flex: 2,
              ),
              ElevatedButton(
                child: Text(
                  'Converter',
                  style: inputStyle,
                ),
                onPressed: () {
                  bool? inicial = valorInicial?.isNotEmpty;
                  bool? convertido = valorConvertido?.isNotEmpty;
                  if (inicial! && convertido!) {
                    conversao(_numberForm!, valorInicial!, valorConvertido!);
                  }
                },
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                (mesgConversao == null) ? '' : mesgConversao.toString(),
                style: labelStyle,
              ),
              const Spacer(
                flex: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
