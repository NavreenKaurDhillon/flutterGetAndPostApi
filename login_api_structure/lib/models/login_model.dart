class LoginModel {
  int? id;
  String? role;
  String? name;
  String? dob;
  String? nickName;
  String? location;
  String? latitude;
  String? longitude;
  String? email;
  String? password;
  dynamic image;
  String? countryCode;
  String? phoneNumber;
  String? gender;
  int? otp;
  int? referalWin;
  int? freeWordsWin;
  String? isVerify;
  String? status;
  String? isNotification;
  String? accountPublic;
  String? nickNameShow;
  String? photoVisiblity;
  String? eventDetailsShow;
  String? interestShow;
  dynamic description;
  int? loginTime;
  int? referalCount;
  dynamic socialId;
  String? socialType;
  String? deviceToken;
  dynamic referalCode;
  dynamic otherReferalCode;
  String? deviceType;
  String? isDelete;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? token;

  LoginModel(
      {this.id,
        this.role,
        this.name,
        this.dob,
        this.nickName,
        this.location,
        this.latitude,
        this.longitude,
        this.email,
        this.password,
        this.image,
        this.countryCode,
        this.phoneNumber,
        this.gender,
        this.otp,
        this.referalWin,
        this.freeWordsWin,
        this.isVerify,
        this.status,
        this.isNotification,
        this.accountPublic,
        this.nickNameShow,
        this.photoVisiblity,
        this.eventDetailsShow,
        this.interestShow,
        this.description,
        this.loginTime,
        this.referalCount,
        this.socialId,
        this.socialType,
        this.deviceToken,
        this.referalCode,
        this.otherReferalCode,
        this.deviceType,
        this.isDelete,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'];
    dob = json['dob'];
    nickName = json['nick_name'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    otp = json['otp'];
    referalWin = json['referal_win'];
    freeWordsWin = json['free_words_win'];
    isVerify = json['is_verify'];
    status = json['status'];
    isNotification = json['is_notification'];
    accountPublic = json['account_public'];
    nickNameShow = json['nick_name_show'];
    photoVisiblity = json['photo_visiblity'];
    eventDetailsShow = json['event_details_show'];
    interestShow = json['interest_show'];
    description = json['description'];
    loginTime = json['login_time'];
    referalCount = json['referal_count'];
    socialId = json['social_id'];
    socialType = json['social_type'];
    deviceToken = json['device_token'];
    referalCode = json['referal_code'];
    otherReferalCode = json['other_referal_code'];
    deviceType = json['device_type'];
    isDelete = json['is_delete'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['nick_name'] = this.nickName;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['email'] = this.email;
    data['password'] = this.password;
    data['image'] = this.image;
    data['country_code'] = this.countryCode;
    data['phone_number'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['otp'] = this.otp;
    data['referal_win'] = this.referalWin;
    data['free_words_win'] = this.freeWordsWin;
    data['is_verify'] = this.isVerify;
    data['status'] = this.status;
    data['is_notification'] = this.isNotification;
    data['account_public'] = this.accountPublic;
    data['nick_name_show'] = this.nickNameShow;
    data['photo_visiblity'] = this.photoVisiblity;
    data['event_details_show'] = this.eventDetailsShow;
    data['interest_show'] = this.interestShow;
    data['description'] = this.description;
    data['login_time'] = this.loginTime;
    data['referal_count'] = this.referalCount;
    data['social_id'] = this.socialId;
    data['social_type'] = this.socialType;
    data['device_token'] = this.deviceToken;
    data['referal_code'] = this.referalCode;
    data['other_referal_code'] = this.otherReferalCode;
    data['device_type'] = this.deviceType;
    data['is_delete'] = this.isDelete;
    data['deletedAt'] = this.deletedAt;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}
