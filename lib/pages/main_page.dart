import 'dart:math';
import 'package:flutter/material.dart';

/// #Página principal

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// Lista de pets que vão aparecer para o usuário, cada perfil tem nome, foto e distância visíveis ao usuário.
  List<UserData> users = [
    UserData("Filó", "assets/icons/dog1.jpeg", "2km de distãncia", false),
    UserData(
        "Negresco", "assets/icons/negresco.jpeg", "5km de distãncia", false),
    UserData("Bidu", "assets/icons/bidu.jpg", "3km de distância", false),
    UserData(
        "Mauricio", "assets/icons/mauricio.jpg", "7km de distância", false),
    UserData("Amora", "assets/icons/amora.jpg", "3.5km de distância", false),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 10),
            Center(
              child: Text(
                "Encontre o par perfeito para o seu pet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            /// Construção do card que contém as informações dos perfis de pets.
            GestureDetector(
              /// Aao clicar em qualquer área do card, chamamos a função proxPet.
              onTap: proxPet,
              child: Card(
                margin: EdgeInsets.all(16.0),
                color: users[currentIndex].favorited
                    ? Color(0xFFD6EAFF)
                    : Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(
                      users[currentIndex].image,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.6,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        users[currentIndex].name,
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        users[currentIndex].distance,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Container que possui três botões de auxílio.
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  /// Ao clicar neste botão, chamamos a função antPet e voltamos para o pet anterior.
                  Tooltip(
                    message: 'Pet anterior',
                    child: IconButton(
                      iconSize: 35,
                      icon: Image.asset("assets/icons/osso.png"),
                      onPressed: antPet,
                    ),
                  ),

                  /// Ao clicar neste botão, chamamos a função favoritar.
                  Tooltip(
                    message: 'Favoritar',
                    child: IconButton(
                      iconSize: 35,
                      icon: Image.asset("assets/icons/distintivo.png"),
                      onPressed: favoritar,
                    ),
                  ),

                  /// Ao clicar neste botão, chamamos a função match
                  Tooltip(
                    message: 'Curtir',
                    child: IconButton(
                      iconSize: 35,
                      icon: Image.asset("assets/icons/cao.png"),
                      onPressed: match,
                    ),
                  ),
                ],
              ),
            ),

            /// Container que armazena imagens que redirecionam para outras páginas.
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .popUntil(ModalRoute.withName("/main"));
                    },

                    /// Esta imagem é a logo do projeto.
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child:
                          Image.asset("assets/icons/logoDog.png", height: 30),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset("assets/icons/chat.png", height: 50),
                    ),
                  ),

                  /// Esta imagem nos leva para a página de perfil (profile_page) ao ser clicada.
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset("assets/icons/perfil.png", height: 30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Função que leva ao perfil posterior ao perfil atual.

  void proxPet() {
    setState(() {
      currentIndex = (currentIndex + 1) % users.length;
    });
  }

  ///Função que volta para o perfil anterior ao perfil atual.

  void antPet() {
    setState(() {
      currentIndex = (currentIndex - 1 + users.length) % users.length;
    });
  }

  /// Função que realiza um toggle para perfis favoritados/não favoritados.

  void favoritar() {
    setState(() {
      users[currentIndex].favorited = !users[currentIndex].favorited;
    });
  }

  /// match invoca as funções seguintes para realizar o funcionamento do "match".

  void match() {
    bool isMatch = checkMatch();
    if (isMatch) {
      mostrarMatch();
    }
  }

  /// Booolean que verifica se deu "match".

  bool checkMatch() {
    return Random().nextBool();
  }

  /// Função para mostrar a caixa de diálogo de "match".

  void mostrarMatch() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Match!"),
          content: Text("Você deu match!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chat');
              },
              child: Text("Ir para o Chat"),
            ),
          ],
        );
      },
    );
  }
}

/// Configuração dos atributos contidos na classe UserData, cada uma dessas instâncias vai ser chamada para aparecer no card ou para realizar a função de favoritar.

class UserData {
  final String name;
  final String image;
  final String distance;
  bool favorited;

  UserData(this.name, this.image, this.distance, this.favorited);
}
