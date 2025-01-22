import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/contact.dart';
import '../cubit/contact_cubit.dart';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({Key? key}) : super(key: key);

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _id = '';
  String _name = '';
  String _phone = '';
  String _email = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final contact = ModalRoute.of(context)!.settings.arguments as Contact?;
    if (contact != null) {
      _id = contact.id;
      _name = contact.name;
      _phone = contact.phone;
      _email = contact.email;
    }
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      if (_id.isEmpty) {
        // Novo contato
        context.read<ContactCubit>().createContact(_name, _phone, _email);
      } else {
        // Editar contato
        context.read<ContactCubit>().updateContact(_id, _name, _phone, _email);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_id.isEmpty ? 'Novo Contato' : 'Editar Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo obrigatório' : null,
                onSaved: (value) => _name = value ?? '',
              ),
              TextFormField(
                initialValue: _phone,
                decoration: const InputDecoration(labelText: 'Telefone'),
                onSaved: (value) => _phone = value ?? '',
              ),
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _email = value ?? '',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
