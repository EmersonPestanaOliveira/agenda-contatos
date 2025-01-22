import '../../data/repositories/contact_repository.dart';

class DeleteContact {
  final ContactRepository repository;

  DeleteContact(this.repository);

  Future<void> call(String contactId) async {
    await repository.deleteContact(contactId);
  }
}
