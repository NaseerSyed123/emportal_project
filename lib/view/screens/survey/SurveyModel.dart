class SurveyModel {
  SurveyModel({
    required this.code,
    required this.data,
    required this.message,
    required this.responseTime,
  });
  late final int code;
  late final List<Data> data;
  late final String message;
  late final String responseTime;

  SurveyModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    message = json['message'];
    responseTime = json['responseTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    _data['responseTime'] = responseTime;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    this.parentId,
    this.userId,
    required this.title,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.questions,
  });
  late final int id;
  late final Null parentId;
  late final Null userId;
  late final String title;
  late final String status;
  late final String startDate;
  late final String endDate;
  late final String createdAt;
  late final String updatedAt;
  late final List<Questions> questions;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    parentId = null;
    userId = null;
    title = json['title'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    questions = List.from(json['questions']).map((e)=>Questions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent_id'] = parentId;
    _data['user_id'] = userId;
    _data['title'] = title;
    _data['status'] = status;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['questions'] = questions.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Questions {
  Questions({
    required this.id,
    required this.parentId,
    this.userId,
    required this.title,
    required this.status,
    this.startDate,
    this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String parentId;
  late final Null userId;
  late final String title;
  late final String status;
  late final Null startDate;
  late final Null endDate;
  late final String createdAt;
  late final String updatedAt;

  Questions.fromJson(Map<String, dynamic> json){
    id = json['id'];
    parentId = json['parent_id'];
    userId = null;
    title = json['title'];
    status = json['status'];
    startDate = null;
    endDate = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent_id'] = parentId;
    _data['user_id'] = userId;
    _data['title'] = title;
    _data['status'] = status;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}