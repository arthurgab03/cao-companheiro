import 'package:flutter/material.dart';

/// #Página de chat.

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: Column(
        children: [
          /// Seção de conversas.
          Expanded(
            child: pagChat(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Ícone para voltar para a página main.
            IconButton(
              icon: Image.asset("assets/icons/logoDog.png"),
              onPressed: () {
                Navigator.of(context).popUntil(ModalRoute.withName("/main"));
              },
            ),

            /// ícone para voltar para a página de perfil.
            IconButton(
              icon: Image.asset("assets/icons/perfil.png"),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget pagChat() {
    return ListView(
      children: [
        // Exemplo de item de conversa
        chat('Usuário 1'),
        chat('Usuário 2'),
      ],
    );
  }

  Widget chat(String userName) {
    return ListTile(
      title: Text(userName),
      onTap: () {},
    );
  }
}
