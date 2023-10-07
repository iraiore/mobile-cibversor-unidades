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
      
  final List<String> medidas = [
    'Metros',
    'Quilômetros',
    'Gramas',
    'Quilogramas',
    'Minutos',
    'Segundos'
  ];

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
          title: Text('Converter unidades'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //TextFild - input usuário
          child: Column(
            children: [
              Text(
                'Valor',
                style:labelStyle,
              ),
              //const Spacer(),
              TextField(
                style: inputStyle,
                decoration: const InputDecoration(hintText: 'Digite o valor a ser convertido'),
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
              //const Spacer(),
              Text(
                'De',
                style:labelStyle,
              ),
              DropdownButton(
                value: valorInicial,
                items: medidas.map(dropDowCreate).toList(),
                isExpanded: true,
                onChanged: (_ ) {},
              ),
              //const Spacer(),
              Text(
                'Para',
                style:labelStyle,
              ),
              DropdownButton(
                value: valorConvertido,
                items: _medidas.map(dropDowCreate).toList(),
                isExpanded: true,
                onChanged: (_) {},
              ),              
              Text((_numberForm == null) ? '' : _numberForm.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
