class ModelTaskGeneral {
  String? status;
  String? startDate;
  String? roomUnitTypeName;
  String? roomUnitTypeId;
  String? roomUnitPropertyName;
  String? roomUnitPropertyId;
  String? roomUnitNumber;
  String? roomUnitId;
  String? roomUnitFloor;
  String? resUnitId;
  String? performerName;
  String? performerId;
  String? notes;
  String? maintenanceTask;
  bool? isUrgent;
  String? id;
  String? endDate;
  String? cleaningTask;
  String? category;

  ModelTaskGeneral(
      {this.status,
        this.startDate,
        this.roomUnitTypeName,
        this.roomUnitTypeId,
        this.roomUnitPropertyName,
        this.roomUnitPropertyId,
        this.roomUnitNumber,
        this.roomUnitId,
        this.roomUnitFloor,
        this.resUnitId,
        this.performerName,
        this.performerId,
        this.notes,
        this.maintenanceTask,
        this.isUrgent,
        this.id,
        this.endDate,
        this.cleaningTask,
        this.category});

  ModelTaskGeneral.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    startDate = json['startDate'];
    roomUnitTypeName = json['roomUnitTypeName'];
    roomUnitTypeId = json['roomUnitTypeId'];
    roomUnitPropertyName = json['roomUnitPropertyName'];
    roomUnitPropertyId = json['roomUnitPropertyId'];
    roomUnitNumber = json['roomUnitNumber'];
    roomUnitId = json['roomUnitId'];
    roomUnitFloor = json['roomUnitFloor'];
    resUnitId = json['resUnitId'];
    performerName = json['performerName'];
    performerId = json['performerId'];
    notes = json['notes'];
    maintenanceTask = json['maintenanceTask'];
    isUrgent = json['isUrgent'];
    id = json['id'];
    endDate = json['endDate'];
    cleaningTask = json['cleaningTask'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['startDate'] = this.startDate;
    data['roomUnitTypeName'] = this.roomUnitTypeName;
    data['roomUnitTypeId'] = this.roomUnitTypeId;
    data['roomUnitPropertyName'] = this.roomUnitPropertyName;
    data['roomUnitPropertyId'] = this.roomUnitPropertyId;
    data['roomUnitNumber'] = this.roomUnitNumber;
    data['roomUnitId'] = this.roomUnitId;
    data['roomUnitFloor'] = this.roomUnitFloor;
    data['resUnitId'] = this.resUnitId;
    data['performerName'] = this.performerName;
    data['performerId'] = this.performerId;
    data['notes'] = this.notes;
    data['maintenanceTask'] = this.maintenanceTask;
    data['isUrgent'] = this.isUrgent;
    data['id'] = this.id;
    data['endDate'] = this.endDate;
    data['cleaningTask'] = this.cleaningTask;
    data['category'] = this.category;
    return data;
  }
}
