import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/contact_model.dart';

class FirebaseDataSource {
  final FirebaseFirestore firestore;

  FirebaseDataSource(this.firestore);

  Future<void> createContact(ContactModel contact) async {
    await firestore.collection('contacts').add(contact.toMap());
  }

  Stream<List<ContactModel>> getContactsStream() {
    return firestore
        .collection('contacts')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return ContactModel.fromMap(doc.data(), doc.id);
            }).toList());
  }

  Future<void> updateContact(ContactModel contact) async {
    await firestore
        .collection('contacts')
        .doc(contact.id)
        .update(contact.toMap());
  }

  Future<void> deleteContact(String contactId) async {
    await firestore.collection('contacts').doc(contactId).delete();
  }
}
