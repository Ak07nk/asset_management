import 'dart:convert';

class MovAblRepIdRespond {
  String? id;
  String? astName;
  String? astDesc;
  String? astCat;
  String? astQty;
  String? astCondition;
  String? astImage;
  String? astRemarks;
  String? createdBy;
  String? astWard;
  String? created;
  String? modified;
  String? astPrDate;
  MovAblRepIdRespond({
    this.id,
    this.astName,
    this.astDesc,
    this.astCat,
    this.astQty,
    this.astCondition,
    this.astImage,
    this.astRemarks,
    this.createdBy,
    this.astWard,
    this.created,
    this.modified,
    this.astPrDate,
  });

  MovAblRepIdRespond copyWith({
    String? id,
    String? astName,
    String? astDesc,
    String? astCat,
    String? astQty,
    String? astCondition,
    String? astImage,
    String? astRemarks,
    String? createdBy,
    String? astWard,
    String? created,
    String? modified,
    String? astPrDate,
  }) {
    return MovAblRepIdRespond(
      id: id ?? this.id,
      astName: astName ?? this.astName,
      astDesc: astDesc ?? this.astDesc,
      astCat: astCat ?? this.astCat,
      astQty: astQty ?? this.astQty,
      astCondition: astCondition ?? this.astCondition,
      astImage: astImage ?? this.astImage,
      astRemarks: astRemarks ?? this.astRemarks,
      createdBy: createdBy ?? this.createdBy,
      astWard: astWard ?? this.astWard,
      created: created ?? this.created,
      modified: modified ?? this.modified,
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

    return result;
  }

  factory MovAblRepIdRespond.fromMap(Map<String, dynamic> map) {
    return MovAblRepIdRespond(
      id: map['id'],
      astName: map['ast_name'],
      astDesc: map['ast_desc'],
      astCat: map['ast_cat'],
      astQty: map['ast_qty'],
      astCondition: map['ast_condition'],
      astImage: map['ast_image'],
      astRemarks: map['ast_remarks'],
      createdBy: map['created_by'],
      astWard: map['ast_ward'],
      created: map['created'],
      modified: map['modified'],
      astPrDate: map['ast_pr_date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovAblRepIdRespond.fromJson(String source) =>
      MovAblRepIdRespond.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovAblRepIdRespond(id: $id, ast_name: $astName, ast_desc: $astDesc, ast_cat: $astCat, ast_qty: $astQty, ast_condition: $astCondition, ast_image: $astImage, ast_remarks: $astRemarks, created_by: $createdBy, ast_ward: $astWard, created: $created, modified: $modified, ast_pr_date: $astPrDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovAblRepIdRespond &&
        other.id == id &&
        other.astName == astName &&
        other.astDesc == astDesc &&
        other.astCat == astCat &&
        other.astQty == astQty &&
        other.astCondition == astCondition &&
        other.astImage == astImage &&
        other.astRemarks == astRemarks &&
        other.createdBy == createdBy &&
        other.astWard == astWard &&
        other.created == created &&
        other.modified == modified &&
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
        astRemarks.hashCode ^
        createdBy.hashCode ^
        astWard.hashCode ^
        created.hashCode ^
        modified.hashCode ^
        astPrDate.hashCode;
  }
}
