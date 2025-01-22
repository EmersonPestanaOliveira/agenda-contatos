import '../../data/models/contact_model.dart';
import '../../data/repositories/contact_repository.dart';

class UpdateContact {
  final ContactRepository repository;

  UpdateContact(this.repository);

  Future<void> call(ContactModel contact) async {
    await repository.updateContact(contact);
  }
}
