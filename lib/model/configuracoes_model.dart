class ConfiguracoesModel{
  String _nomeUsuario = "";
  double _altura = 0;
  bool _receberNotificacoes = false;
  bool _modoEscuro = false;

  ConfiguracoesModel(
    this._nomeUsuario, 
    this._altura, 
    this._receberNotificacoes, 
    this._modoEscuro
  );

  ConfiguracoesModel.vazio(){
    _nomeUsuario = "";
    _altura = 0;
    _receberNotificacoes = false;
    _modoEscuro = false;
  }

  String get nomeUsuario => _nomeUsuario;

  void set nomeUsuario(String nomeUsuario){
    _nomeUsuario=nomeUsuario;
  }

  double get altura => _altura;

  void set altura(double altura){
    _altura=altura;
  }

  bool get recebeNotificacoes => _receberNotificacoes;

  void set recebeNotificacoes(bool value){
    _receberNotificacoes=value;
  }

  bool get modoEscuro => _modoEscuro;

  void set modoEscuro(bool value){
    _modoEscuro=value;
  }
}