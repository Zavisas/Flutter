import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Contact {
  final String name; //nome do aluno
  final String RA; // RA do aluno
  final String imagePath; // Imagem

  Contact(this.name, this.RA, this.imagePath);
}

class MyApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact('João Zavisas', 'RA: 1431432312032', 'assets/contact_images/JoaoZavisas.png'),
    Contact('Ana Flavia', 'RA: 000000000000', 'assets/contact_images/woman.png'),
    Contact('Yudi', 'RA: 000000000000 ', 'assets/contact_images/yudi.png'),
    Contact('Marcos', 'RA: 000000000000', 'assets/contact_images/homem.png')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple, //cor container
          title: Text('Lista de Contatos | Fatec '), //texto dentro desse container
        ),
        body: ContactList(contacts),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  final List<Contact> contacts;

  ContactList(this.contacts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                contacts[index].imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(contacts[index].name),
          subtitle: Text(contacts[index].RA),
        );
      },
    );
  }
}
