import '../../data/models/contact_model.dart';
import '../../data/repositories/contact_repository.dart';

class ReadContacts {
  final ContactRepository repository;

  ReadContacts(this.repository);

  Stream<List<ContactModel>> call() {
    return repository.getContactsStream();
  }
}
