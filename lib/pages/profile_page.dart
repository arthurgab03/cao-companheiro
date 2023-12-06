import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// #Página de perfil.

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            /// Segmento que contém dados necessários sobre o perfil do usuário, como nome e foto por exemplo.
            children: [
              SizedBox(height: 10),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/icons/hachi.png'),
              ),
              SizedBox(height: 10),
              Text(
                'Hachi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Recife - PE',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Informações',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              /// Textos que contém informações secundárias sobre o perfil do usuário.
              /// *Observação* Fiz dois containers para que tivessem duas colunas com 3 imagens.
              SizedBox(height: 10),
              infos('Nome', 'Hachi'),
              infos('Número de Seguidores', '1000'),
              infos('Número de Contas Seguindo', '500'),
              infos('Idade', '2 anos e 5 meses'),
              SizedBox(height: 20),
              Text(
                'Minhas fotos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              /// Aba de fotos do pet do usuário.
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    galeriaFoto("assets/icons/hachi2.jpeg"),
                    galeriaFoto("assets/icons/hachi3.jpeg"),
                    galeriaFoto("assets/icons/hachi4.jpeg"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    galeriaFoto("assets/icons/hachi5.jpeg"),
                    galeriaFoto("assets/icons/hachi1.jpeg"),
                    galeriaFoto("assets/icons/hachi6.jpeg"),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),

      ///Barra de navegação que possui imagens que nos redirecionam para outras páginas.
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).popUntil(ModalRoute.withName("/main"));
              },

              /// Ao clicar nesta imagem, somos redirecionados para a página principal (main_page).
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/icons/logoDog.png", height: 30),
              ),
            ),

            /// Ao clicar nesta imagem, realizamos o signOut e somos redirecionados para a tela de login.
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut().then((result) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/login", (_) => false);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/icons/sair.png", height: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infos(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget galeriaFoto(String imagePath) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
