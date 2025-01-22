import '../../domain/entities/contact.dart';

class ContactModel extends Contact {
  ContactModel({
    required String id,
    required String name,
    required String phone,
    required String email,
  }) : super(
          id: id,
          name: name,
          phone: phone,
          email: email,
        );

  factory ContactModel.fromMap(Map<String, dynamic> map, String docId) {
    return ContactModel(
      id: docId,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}
