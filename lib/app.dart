import 'package:flutter/material.dart';
import 'modules/contacts/presentation/pages/contact_list_page.dart';
import 'modules/contacts/presentation/pages/contact_form_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda de Contatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ContactListPage(),
        '/form': (context) => const ContactFormPage(),
      },
    );
  }
}
