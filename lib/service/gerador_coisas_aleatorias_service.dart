import 'dart:math';


class GeradorCoisasAleatorias{

  static String geraPalavraAleatoria(){

    final List<String> words= ['apple','cat','dog'];
    Random random = Random();

    return words[random.nextInt(words.length)];
  }

  static int geraNumeroAletorio(){
    Random numeroAleatorio = Random();

    return numeroAleatorio.nextInt(1000);
  }
}