import 'dart:convert';

class RegisterReq {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? role;
  RegisterReq({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.role,
  });

  RegisterReq copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phone,
    String? role,
  }) {
    return RegisterReq(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

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

    return result;
  }

  factory RegisterReq.fromMap(Map<String, dynamic> map) {
    return RegisterReq(
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      role: map['role'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterReq.fromJson(String source) =>
      RegisterReq.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterReq(first_name: $firstName, last_name: $lastName, email: $email, password: $password, phone: $phone, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterReq &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.role == role;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        role.hashCode;
  }
}

class RegisterResp {
  bool? status;
  String? message;
  int? data;
  RegisterResp({
    this.status,
    this.message,
    this.data,
  });

  RegisterResp copyWith({
    bool? status,
    String? message,
    int? data,
  }) {
    return RegisterResp(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (status != null) {
      result.addAll({'status': status});
    }
    if (message != null) {
      result.addAll({'message': message});
    }
    if (data != null) {
      result.addAll({'data': data});
    }

    return result;
  }

  factory RegisterResp.fromMap(Map<String, dynamic> map) {
    return RegisterResp(
      status: map['status'],
      message: map['message'],
      data: map['data']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResp.fromJson(String source) =>
      RegisterResp.fromMap(json.decode(source));

  @override
  String toString() =>
      'RegisterResp(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterResp &&
        other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
