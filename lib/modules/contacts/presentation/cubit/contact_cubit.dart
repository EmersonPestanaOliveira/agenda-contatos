import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/contact_model.dart';
import '../../data/repositories/contact_repository.dart';
import '../../domain/usecases/create_contact.dart';
import '../../domain/usecases/delete_contact.dart';
import '../../domain/usecases/read_contact.dart';
import '../../domain/usecases/update_contact.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final ContactRepository repository;
  final CreateContact createContactUseCase;
  final ReadContacts readContactsUseCase;
  final UpdateContact updateContactUseCase;
  final DeleteContact deleteContactUseCase;

  ContactCubit(
    this.repository, {
    required this.createContactUseCase,
    required this.readContactsUseCase,
    required this.updateContactUseCase,
    required this.deleteContactUseCase,
  }) : super(ContactInitial());

  // Exemplo de método que obtém todos os contatos
  void loadContacts() {
    emit(ContactLoading());
    final contactsStream = readContactsUseCase();
    contactsStream.listen(
      (contactsList) {
        emit(ContactLoaded(contactsList));
      },
      onError: (error) {
        emit(ContactError(error.toString()));
      },
    );
  }

  Future<void> createContact(String name, String phone, String email) async {
    try {
      final contact = ContactModel(
        id: '', // será definido pelo Firestore
        name: name,
        phone: phone,
        email: email,
      );
      await repository.createContact(contact);
    } catch (e) {
      emit(ContactError(e.toString()));
    }
  }

  Future<void> updateContact(
      String id, String name, String phone, String email) async {
    try {
      final contact = ContactModel(
        id: id,
        name: name,
        phone: phone,
        email: email,
      );
      await repository.updateContact(contact);
    } catch (e) {
      emit(ContactError(e.toString()));
    }
  }

  Future<void> deleteContact(String id) async {
    try {
      await repository.deleteContact(id);
    } catch (e) {
      emit(ContactError(e.toString()));
    }
  }
}
