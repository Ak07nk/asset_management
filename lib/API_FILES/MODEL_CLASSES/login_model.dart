import 'dart:convert';

class LoginRequest {
  String? xAPIKEY;
  String? email;
  String? password;
  LoginRequest({
    this.xAPIKEY,
    this.email,
    this.password,
  });

 

  LoginRequest copyWith({
    String? xAPIKEY,
    String? email,
    String? password,
  }) {
    return LoginRequest(
      xAPIKEY: xAPIKEY ?? this.xAPIKEY,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(xAPIKEY != null){
      result.addAll({'X-API-KEY': xAPIKEY});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(password != null){
      result.addAll({'password': password});
    }
  
    return result;
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      xAPIKEY: map['X-API-KEY'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromJson(String source) => LoginRequest.fromMap(json.decode(source));

  @override
  String toString() => 'LoginRequest(X-API-KEY: $xAPIKEY, email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginRequest &&
      other.xAPIKEY == xAPIKEY &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => xAPIKEY.hashCode ^ email.hashCode ^ password.hashCode;
}

class LoginRespons {
  bool? status;
  String? message;
  Data? data;
  LoginRespons({
    this.status,
    this.message,
    this.data,
  });



  LoginRespons copyWith({
    bool? status,
    String? message,
    Data? data,
  }) {
    return LoginRespons(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(status != null){
      result.addAll({'status': status});
    }
    if(message != null){
      result.addAll({'message': message});
    }
    if(data != null){
      result.addAll({'data': data!.toMap()});
    }
  
    return result;
  }

  factory LoginRespons.fromMap(Map<String, dynamic> map) {
    return LoginRespons(
      status: map['status'],
      message: map['message'],
      data: map['data'] != null ? Data.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRespons.fromJson(String source) => LoginRespons.fromMap(json.decode(source));

  @override
  String toString() => 'LoginRespons(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginRespons &&
      other.status == status &&
      other.message == message &&
      other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class Data {
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
  Data({
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



  Data copyWith({
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
    return Data(
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
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(firstName != null){
      result.addAll({'first_name': firstName});
    }
    if(lastName != null){
      result.addAll({'last_name': lastName});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(password != null){
      result.addAll({'password': password});
    }
    if(phone != null){
      result.addAll({'phone': phone});
    }
    if(role != null){
      result.addAll({'role': role});
    }
    if(created != null){
      result.addAll({'created': created});
    }
    if(modified != null){
      result.addAll({'modified': modified});
    }
    if(status != null){
      result.addAll({'status': status});
    }
  
    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
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

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, first_name: $firstName, last_name: $lastName, email: $email, password: $password, phone: $phone, role: $role, created: $created, modified: $modified, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
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
