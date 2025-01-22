// create_contact.dart
import '../../data/models/contact_model.dart';
import '../../data/repositories/contact_repository.dart';

class CreateContact {
  final ContactRepository repository;

  CreateContact(this.repository);

  Future<void> call(ContactModel contact) async {
    return repository.createContact(contact);
  }
}
