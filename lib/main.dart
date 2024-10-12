import 'package:flutter/material.dart';


void main() {
  runApp(const MaterialApp(
    home: TelaPrincipal(),
  ));
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});


  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  double? valorX = 0; // Valor que será alterado
  double? valorY = 0;
  double? resultadoSoma = 0;
  double? resultadoSub = 0;
  double? resultadoMult = 0;
  double? resultadoDivi = 0;


  void somarXeY() {
    setState(() {
      resultadoSoma = (valorX ?? 0) + (valorY ?? 0);
    });
  }
  void subtrairXeY() {
    setState(() {
      resultadoSub = (valorX ?? 0) - (valorY ?? 0);
    });
  }
  void multiplicarXeY() {
    setState(() {
      resultadoMult = (valorX ?? 0) * (valorY ?? 0);
    });
  }
  void dividirXeY() {
    setState(() {
      if(valorY != 0){
      resultadoDivi = (valorX ?? 0) / (valorY ?? 0);
      }
      else{
        resultadoDivi = 0;
      }
    });
  }
  void _navegarParaTelaSecundaria(String xOUy) async {
    //async é utilizada para falar que uma operação pode levar tempo
    final resultado = await Navigator.push(
      //resultado receber o valor digitado na outra dela
      //Comando para ir para a proxima tela // await pausa a função até que a operação anterior seja concluida
      context,
      MaterialPageRoute(
        builder: (context) => TelaSecundaria(
            varNome:
                xOUy), // variavel da outra tela eo valor que esa vai receber
      ),
    );


    // Verifica se um valor foi retornado
    if (resultado != null) {
      // Converte a string recebida em um double
      setState(() {
        if (xOUy == "X") {
          valorX = double.tryParse(// Aqui convertemos a string para um número
              resultado);
        } else {
          valorY = double.tryParse(resultado);
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"), //Texto do titulo
      ),
      body: Center(
          child: Column(
        //Coluna de widgets
        mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
        crossAxisAlignment:
            CrossAxisAlignment.center, // Centraliza horizontalmente
        children: [
          Row(
              //Deixa um widget do lado do outro
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centraliza horizontalmente no Row
              children: [
                ElevatedButton(
                  onPressed: () {
                    _navegarParaTelaSecundaria("X");
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromARGB(255, 100, 111,
                            139)), //Define a cor de fundo do botão
                    foregroundColor: WidgetStateProperty.all<Color>(
                        Colors.white), //define a cor do texto do botão
                  ),
                  child: const Text('Informar X'), //Texto botão
                ),
                const SizedBox(
                    width: 100), //define o espaçamento entre o texto e o botão
                ElevatedButton(
                  onPressed: () {
                    _navegarParaTelaSecundaria("Y");
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromARGB(255, 100, 111,
                            139)), //Define a cor de fundo do botão
                    foregroundColor: WidgetStateProperty.all<Color>(
                        Colors.white), //define a cor do texto do botão
                  ),
                  child: const Text('Informar Y'), //Texto botão
                ),
              ]),
              const Padding(
                  padding: EdgeInsets.only(top: 30), // Espaçamento de 20 pixels acima do próximo widget
                ),
          Row(
              //Deixa um widget do lado do outro
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centraliza horizontalmente no Row
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30), // Espaçamento de 20 pixels acima do próximo widget
                ),
                Text("${valorX}"),
                const SizedBox(
                    width: 100), //define o espaçamento entre o texto e o botão
                const Text("+"),
                const SizedBox(
                    width: 50),
                Text("${valorY}"),
                const Text("   ="),
                const SizedBox(
                    width: 50),
                Text("${resultadoSoma}")
              ]),
          Row(
              //Deixa um widget do lado do outro
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centraliza horizontalmente no Row
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30), // Espaçamento de 20 pixels acima do próximo widget
                ),
                Text("${valorX}"),
                const SizedBox(
                    width: 100), //define o espaçamento entre o texto e o botão
                const Text("-"),
                const SizedBox(
                    width: 50),
                Text("${valorY}"),
                const Text("   ="),
                const SizedBox(
                    width: 50),
                Text("${resultadoSub}")
              ]),
            Row(
              //Deixa um widget do lado do outro
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centraliza horizontalmente no Row
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30), // Espaçamento de 20 pixels acima do próximo widget
                ),
                Text("${valorX}"),
                const SizedBox(
                    width: 100), //define o espaçamento entre o texto e o botão
                const Text("x"),
                const SizedBox(
                    width: 50),
                Text("${valorY}"),
                const Text("   ="),
                const SizedBox(
                    width: 50),
                Text("${resultadoMult}")
              ]),
            Row(
              //Deixa um widget do lado do outro
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centraliza horizontalmente no Row
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30), // Espaçamento de 20 pixels acima do próximo widget
                ),
                Text("${valorX}"),
                const SizedBox(
                    width: 100), //define o espaçamento entre o texto e o botão
                const Text("÷"),
                const SizedBox(
                    width: 50),
                Text("${valorY}"),
                const Text("   ="),
                const SizedBox(
                    width: 50),
                Text("${resultadoDivi}")
              ]),    
          const Padding(
                  padding: EdgeInsets.only(top: 30), // Espaçamento de 20 pixels acima do próximo widget
                ),
          ElevatedButton(
              onPressed: () {
                somarXeY();
                subtrairXeY();
                multiplicarXeY();
                dividirXeY();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                    const Color.fromARGB(
                        255, 100, 111, 139)), //Define a cor de fundo do botão
                foregroundColor: WidgetStateProperty.all<Color>(
                    Colors.white), //define a cor do texto do botão
              ),
              child: const Text("Calcular")),
        ],
      )),
    );
  }
}  

class TelaSecundaria extends StatefulWidget {
  const TelaSecundaria({Key? key, required this.varNome}) : super(key: key);
  final String varNome; //Recebe a variavel da tela principal


  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}


class _TelaSecundariaState extends State<TelaSecundaria> {
  // Controlador para o campo de texto
  TextEditingController _numberController = TextEditingController();


  // Variável para armazenar o número digitado
  double? storedNumber;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Defina o valor de " +
            widget.varNome), // Correção aqui, acessando via widget,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
          crossAxisAlignment:
            CrossAxisAlignment.center, // Centraliza horizontalmente
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType
                  .number, //faz com que o textField aceite apenas números
              decoration: InputDecoration(
                labelText: 'Digite o valor',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(width: 100),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context,
                      _numberController.text); //retorna pra pagina inicial
                },
                child: Text('Salvar'))
          ],
        ),
      ),
    );
  }
}