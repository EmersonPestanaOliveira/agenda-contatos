import '../datasources/firebase_datasource.dart';
import '../models/contact_model.dart';

class ContactRepository {
  final FirebaseDataSource dataSource;

  ContactRepository(this.dataSource);

  Future<void> createContact(ContactModel contact) {
    return dataSource.createContact(contact);
  }

  Stream<List<ContactModel>> getContactsStream() {
    return dataSource.getContactsStream();
  }

  Future<void> updateContact(ContactModel contact) {
    return dataSource.updateContact(contact);
  }

  Future<void> deleteContact(String contactId) {
    return dataSource.deleteContact(contactId);
  }
}
