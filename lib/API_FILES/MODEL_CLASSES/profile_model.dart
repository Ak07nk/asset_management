import 'dart:convert';

class ProfileResp {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? role;
  String? created;
  String? modified;
  String? status;
  ProfileResp({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.role,
    this.created,
    this.modified,
    this.status,
  });

  ProfileResp copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phone,
    String? role,
    String? created,
    String? modified,
    String? status,
  }) {
    return ProfileResp(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      created: created ?? this.created,
      modified: modified ?? this.modified,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (firstName != null) {
      result.addAll({'first_name': firstName});
    }
    if (lastName != null) {
      result.addAll({'last_name': lastName});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (role != null) {
      result.addAll({'role': role});
    }
    if (created != null) {
      result.addAll({'created': created});
    }
    if (modified != null) {
      result.addAll({'modified': modified});
    }
    if (status != null) {
      result.addAll({'status': status});
    }

    return result;
  }

  factory ProfileResp.fromMap(Map<String, dynamic> map) {
    return ProfileResp(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      role: map['role'],
      created: map['created'],
      modified: map['modified'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileResp.fromJson(String source) =>
      ProfileResp.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileResp(id: $id, first_name: $firstName, last_name: $lastName, email: $email, password: $password, phone: $phone, role: $role, created: $created, modified: $modified, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileResp &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.role == role &&
        other.created == created &&
        other.modified == modified &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        role.hashCode ^
        created.hashCode ^
        modified.hashCode ^
        status.hashCode;
  }
}
