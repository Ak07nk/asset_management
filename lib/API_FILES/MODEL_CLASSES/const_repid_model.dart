import 'dart:convert';

class ConstructionRepidRespond {
  String? id;
  String? astName;
  String? astDesc;
  String? astCat;
  String? astQty;
  String? astCondition;
  String? astImage;
  String? astAddress;
  String? astPincode;
  String? astRemarks;
  String? createdBy;
  String? astWard;
  String? created;
  String? modified;
  String? astconsstage;
  String? astPrDate;
  ConstructionRepidRespond({
    this.id,
    this.astName,
    this.astDesc,
    this.astCat,
    this.astQty,
    this.astCondition,
    this.astImage,
    this.astAddress,
    this.astPincode,
    this.astRemarks,
    this.createdBy,
    this.astWard,
    this.created,
    this.modified,
    this.astconsstage,
    this.astPrDate,
  });

  ConstructionRepidRespond copyWith({
    String? id,
    String? astName,
    String? astDesc,
    String? astCat,
    String? astQty,
    String? astCondition,
    String? astImage,
    String? astAddress,
    String? astPincode,
    String? astRemarks,
    String? createdBy,
    String? astWard,
    String? created,
    String? modified,
    String? astconsstage,
    String? astPrDate,
  }) {
    return ConstructionRepidRespond(
      id: id ?? this.id,
      astName: astName ?? this.astName,
      astDesc: astDesc ?? this.astDesc,
      astCat: astCat ?? this.astCat,
      astQty: astQty ?? this.astQty,
      astCondition: astCondition ?? this.astCondition,
      astImage: astImage ?? this.astImage,
      astAddress: astAddress ?? this.astAddress,
      astPincode: astPincode ?? this.astPincode,
      astRemarks: astRemarks ?? this.astRemarks,
      createdBy: createdBy ?? this.createdBy,
      astWard: astWard ?? this.astWard,
      created: created ?? this.created,
      modified: modified ?? this.modified,
      astconsstage: astconsstage ?? this.astconsstage,
      astPrDate: astPrDate ?? this.astPrDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (astName != null) {
      result.addAll({'ast_name': astName});
    }
    if (astDesc != null) {
      result.addAll({'ast_desc': astDesc});
    }
    if (astCat != null) {
      result.addAll({'ast_cat': astCat});
    }
    if (astQty != null) {
      result.addAll({'ast_qty': astQty});
    }
    if (astCondition != null) {
      result.addAll({'ast_condition': astCondition});
    }
    if (astImage != null) {
      result.addAll({'ast_image': astImage});
    }
    if (astAddress != null) {
      result.addAll({'ast_address': astAddress});
    }
    if (astPincode != null) {
      result.addAll({'ast_pincode': astPincode});
    }
    if (astRemarks != null) {
      result.addAll({'ast_remarks': astRemarks});
    }
    if (createdBy != null) {
      result.addAll({'created_by': createdBy});
    }
    if (astWard != null) {
      result.addAll({'ast_ward': astWard});
    }
    if (created != null) {
      result.addAll({'created': created});
    }
    if (modified != null) {
      result.addAll({'modified': modified});
    }
    if (astPrDate != null) {
      result.addAll({'ast_pr_date': astPrDate});
    }
    if (astconsstage != null) {
      result.addAll({'ast_cons_stage': astconsstage});
    }

    return result;
  }

  factory ConstructionRepidRespond.fromMap(Map<String, dynamic> map) {
    return ConstructionRepidRespond(
      id: map['id'],
      astName: map['ast_name'],
      astDesc: map['ast_desc'],
      astCat: map['ast_cat'],
      astQty: map['ast_qty'],
      astCondition: map['ast_condition'],
      astImage: map['ast_image'],
      astAddress: map['ast_address'],
      astPincode: map['ast_pincode'],
      astRemarks: map['ast_remarks'],
      createdBy: map['created_by'],
      astWard: map['ast_ward'],
      created: map['created'],
      modified: map['modified'],
      astPrDate: map['ast_pr_date'],
      astconsstage: map['ast_cons_stage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConstructionRepidRespond.fromJson(String source) =>
      ConstructionRepidRespond.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConstructionRepidRespond(id: $id, ast_name: $astName, ast_desc: $astDesc, ast_cat: $astCat, ast_qty: $astQty, ast_condition: $astCondition, ast_image: $astImage, ast_address: $astAddress, ast_pincode: $astPincode, ast_remarks: $astRemarks, created_by: $createdBy, ast_ward: $astWard, created: $created, modified: $modified,ast_cons_stage:$astconsstage,ast_pr_date: $astPrDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConstructionRepidRespond &&
        other.id == id &&
        other.astName == astName &&
        other.astDesc == astDesc &&
        other.astCat == astCat &&
        other.astQty == astQty &&
        other.astCondition == astCondition &&
        other.astImage == astImage &&
        other.astAddress == astAddress &&
        other.astPincode == astPincode &&
        other.astRemarks == astRemarks &&
        other.createdBy == createdBy &&
        other.astWard == astWard &&
        other.created == created &&
        other.modified == modified &&
        other.astconsstage == astconsstage &&
        other.astPrDate == astPrDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        astName.hashCode ^
        astDesc.hashCode ^
        astCat.hashCode ^
        astQty.hashCode ^
        astCondition.hashCode ^
        astImage.hashCode ^
        astAddress.hashCode ^
        astPincode.hashCode ^
        astRemarks.hashCode ^
        createdBy.hashCode ^
        astWard.hashCode ^
        created.hashCode ^
        modified.hashCode ^
        astconsstage.hashCode ^
        astPrDate.hashCode;
  }
}
