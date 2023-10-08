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
    'Metros',
    'Quilômetros',
    'Gramas',
    'Quilogramas',
    'Minutos',
    'Segundos'
  ];
  final Map<String, int> medidasMap = {
    'Metros': 0,
    'Quilômetros': 1,
    'Gramas': 2,
    'Quilogramas': 3,
    'Minutos': 4,
    'Segundos': 5,
  };

  final dynamic formulasConversao = {
    '0': [1, 0.001, 0, 0, 0, 0],
    '1': [1000, 1, 0, 0, 0, 0],
    '2': [0, 0, 1, 0.001, 0, 0],
    '3': [0, 0, 1000, 1, 0, 0],
    '4': [0, 0, 0, 0, 1, 60],
    '5': [0, 0, 0, 0, 0.01666667, 1],
  };

  void conversao(double medidas, String De, String Para) {
    int? nDe = medidasMap[De];
    int? nPara = medidasMap[Para];
    var fatorConversao = formulasConversao[nDe.toString()][nPara];
    double resultado = medidas * fatorConversao;
    String msg = "";
    if (resultado == 0) {
      msg = 'O valor não pode ser convertivo';
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
