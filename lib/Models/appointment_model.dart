// To parse this JSON data, do
//
//     final getAppointments = getAppointmentsFromJson(jsonString);

import 'dart:convert';

GetAppointments getAppointmentsFromJson(String str) => GetAppointments.fromJson(json.decode(str));

String getAppointmentsToJson(GetAppointments data) => json.encode(data.toJson());

class GetAppointments {
  GetAppointments({
    this.response,
  });

  Response? response;

  factory GetAppointments.fromJson(Map<String, dynamic> json) => GetAppointments(
        response: Response.fromJson(json["Response"]),
      );

  Map<String, dynamic> toJson() => {
        "Response": response!.toJson(),
      };
}

class Response {
  Response({
    this.responseCode,
    this.apiName,
    this.responseDescription,
    this.defaults,
    this.appointments,
  });

  ApiName? responseCode;
  ApiName? apiName;
  ApiName? responseDescription;
  Defaults? defaults;
  Appointments? appointments;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        responseCode: ApiName.fromJson(json["ResponseCode"]),
        apiName: ApiName.fromJson(json["APIName"]),
        responseDescription: ApiName.fromJson(json["ResponseDescription"]),
        defaults: Defaults.fromJson(json["Defaults"]),

        appointments: Appointments.fromJson(json["Appointments"]),
      );
         bool checkIfAnyIsNull() {
    return [responseCode, apiName, responseDescription, defaults, appointments].contains(null);
         }

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode!.toJson(),
        "APIName": apiName!.toJson(),
        "ResponseDescription": responseDescription!.toJson(),
        "Defaults": defaults!.toJson(),
        "Appointments": appointments!.toJson(),
      };
}

class ApiName {
  ApiName({
    this.t,
  });

  String? t;

  factory ApiName.fromJson(Map<String, dynamic> json) => ApiName(
        t: json["\u0024t"] == null ? null : json["\u0024t"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024t": t == null ? null : t,
      };
}

class Appointments {
  Appointments({
    this.appointment,
  });

  List<Appointment>? appointment;

  factory Appointments.fromJson(Map<String, dynamic> json) => Appointments(
        appointment: List<Appointment>.from([Appointment.fromJson(json["Appointment"])]).toList(),
        
        // appointment: (json["Appointment"] as List<dynamic>).map((x) => Appointment.fromJson(x as Map<String, dynamic>)).toList(),
      );
          bool checkIfAnyIsNull() {
    return [appointment].contains(null);
         }

  Map<String, dynamic> toJson() => {
        "Appointment": appointment!.map((x) => x.toJson()).toList(),
      };
}

class Appointment {
  Appointment({
    this.additionalEngineerId,
    this.slAppId,
    this.sortOrder,
    this.appointmentType,
    this.serviceProviderId,
    this.sendCustomerReceiptEmail,
    this.timeSlot,
    this.appointmentDefaults,
    this.jobDetails,
    this.jobFaultCodes,
    this.customerDetails,
    this.unitDetails,
    this.warrantyDetails,
    this.faultReport,
    this.partsAttached,
    this.serviceHistory,
    this.jobAttachments,
    this.contactHistories,
  });

  ApiName? additionalEngineerId;
  ApiName? slAppId;
  ApiName? sortOrder;
  ApiName? appointmentType;
  ApiName? serviceProviderId;
  ApiName? sendCustomerReceiptEmail;
  ApiName? timeSlot;
  AppointmentDefaults? appointmentDefaults;
  JobDetails? jobDetails;
  DisclaimerText? jobFaultCodes;
  CustomerDetails? customerDetails;
  UnitDetails? unitDetails;
  WarrantyDetails? warrantyDetails;
  FaultReport? faultReport;
  DisclaimerText? partsAttached;
  ServiceHistory? serviceHistory;
  DisclaimerText? jobAttachments;
  ContactHistories? contactHistories;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        additionalEngineerId: ApiName.fromJson(json["AdditionalEngineerID"]),
        slAppId: ApiName.fromJson(json["SLAppID"]),
        sortOrder: ApiName.fromJson(json["SortOrder"]),
        appointmentType: ApiName.fromJson(json["AppointmentType"]),
        serviceProviderId: ApiName.fromJson(json["ServiceProviderID"]),
        sendCustomerReceiptEmail: ApiName.fromJson(json["SendCustomerReceiptEmail"]),
        timeSlot: ApiName.fromJson(json["TimeSlot"]),
        appointmentDefaults: AppointmentDefaults.fromJson(json["AppointmentDefaults"]),
        jobDetails: JobDetails.fromJson(json["JobDetails"]),
        jobFaultCodes: DisclaimerText.fromJson(json["JobFaultCodes"]),
        customerDetails: CustomerDetails.fromJson(json["CustomerDetails"]),
        unitDetails: UnitDetails.fromJson(json["UnitDetails"]),
        warrantyDetails: WarrantyDetails.fromJson(json["WarrantyDetails"]),
        faultReport: FaultReport.fromJson(json["FaultReport"]),
        partsAttached: DisclaimerText.fromJson(json["PartsAttached"]),
        serviceHistory: ServiceHistory.fromJson(json["ServiceHistory"]),
        jobAttachments: DisclaimerText.fromJson(json["JobAttachments"]),
        contactHistories: ContactHistories.fromJson(json["ContactHistories"]),
      );

  Map<String, dynamic> toJson() => {
        "AdditionalEngineerID": additionalEngineerId!.toJson(),
        "SLAppID": slAppId!.toJson(),
        "SortOrder": sortOrder!.toJson(),
        "AppointmentType": appointmentType!.toJson(),
        "ServiceProviderID": serviceProviderId!.toJson(),
        "SendCustomerReceiptEmail": sendCustomerReceiptEmail!.toJson(),
        "TimeSlot": timeSlot!.toJson(),
        "AppointmentDefaults": appointmentDefaults!.toJson(),
        "JobDetails": jobDetails!.toJson(),
        "JobFaultCodes": jobFaultCodes!.toJson(),
        "CustomerDetails": customerDetails!.toJson(),
        "UnitDetails": unitDetails!.toJson(),
        "WarrantyDetails": warrantyDetails!.toJson(),
        "FaultReport": faultReport!.toJson(),
        "PartsAttached": partsAttached!.toJson(),
        "ServiceHistory": serviceHistory!.toJson(),
        "JobAttachments": jobAttachments!.toJson(),
        "ContactHistories": contactHistories!.toJson(),
      };
}

class AppointmentDefaults {
  AppointmentDefaults({
    this.outCardLeft,
    this.customerDetailsChecked,
    this.unitDetailsChecked,
    this.warrantyDetailsChecked,
    this.closeVisitAllowed,
    this.appointmentCompleted,
    this.completionStatusRequired,
    this.confirmedByUser,
    this.confirmedByUserDate,
    this.cancelled,
  });

  ApiName? outCardLeft;
  ApiName? customerDetailsChecked;
  ApiName? unitDetailsChecked;
  ApiName? warrantyDetailsChecked;
  ApiName? closeVisitAllowed;
  ApiName? appointmentCompleted;
  ApiName? completionStatusRequired;
  ApiName? confirmedByUser;
  DisclaimerText? confirmedByUserDate;
  ApiName? cancelled;

  factory AppointmentDefaults.fromJson(Map<String, dynamic> json) => AppointmentDefaults(
        outCardLeft: ApiName.fromJson(json["OutCardLeft"]),
        customerDetailsChecked: ApiName.fromJson(json["CustomerDetailsChecked"]),
        unitDetailsChecked: ApiName.fromJson(json["UnitDetailsChecked"]),
        warrantyDetailsChecked: ApiName.fromJson(json["WarrantyDetailsChecked"]),
        closeVisitAllowed: ApiName.fromJson(json["CloseVisitAllowed"]),
        appointmentCompleted: ApiName.fromJson(json["AppointmentCompleted"]),
        completionStatusRequired: ApiName.fromJson(json["CompletionStatusRequired"]),
        confirmedByUser: ApiName.fromJson(json["ConfirmedByUser"]),
        confirmedByUserDate: DisclaimerText.fromJson(json["ConfirmedByUserDate"]),
        cancelled: ApiName.fromJson(json["Cancelled"]),
      );

  Map<String, dynamic> toJson() => {
        "OutCardLeft": outCardLeft!.toJson(),
        "CustomerDetailsChecked": customerDetailsChecked!.toJson(),
        "UnitDetailsChecked": unitDetailsChecked!.toJson(),
        "WarrantyDetailsChecked": warrantyDetailsChecked!.toJson(),
        "CloseVisitAllowed": closeVisitAllowed!.toJson(),
        "AppointmentCompleted": appointmentCompleted!.toJson(),
        "CompletionStatusRequired": completionStatusRequired!.toJson(),
        "ConfirmedByUser": confirmedByUser!.toJson(),
        "ConfirmedByUserDate": confirmedByUserDate!.toJson(),
        "Cancelled": cancelled!.toJson(),
      };
}

class DisclaimerText {
  DisclaimerText({
    this.t
  });
   String? t;
 factory DisclaimerText.fromJson(Map<String, dynamic> json) => DisclaimerText(
        t: json["\u0024t"] == null ? null : json["\u0024t"],
      );

  //factory DisclaimerText.fromJson(Map<String, dynamic> json) => DisclaimerText();

 Map<String, dynamic> toJson() => {
        "\u0024t": t == null ? null : t,
      };
  
}


class ContactHistories {
  ContactHistories({
    this.contactHistory,
  });

  List<ContactHistory>? contactHistory;

  factory ContactHistories.fromJson(Map<String, dynamic> json) => ContactHistories(
        // contactHistory: List<ContactHistory>.from(json["ContactHistory"].map((e) => ContactHistory.fromJson(e))),
         contactHistory: List<ContactHistory>.from([ContactHistory.fromJson(json["ContactHistory"])]).toList(),
      );

  Map<String, dynamic> toJson() => {
        "ContactHistory": List<dynamic>.from(contactHistory!.map((x) => x.toJson())),
      };
}

class ContactHistory {
  ContactHistory({
    this.date,
    this.time,
    this.user,
    this.appointmentId,
    this.action,
    this.notes,
  });

  ApiName? date;
  ApiName? time;
  ApiName? user;
  ApiName? appointmentId;
  ApiName? action;
  ApiName? notes;

  factory ContactHistory.fromJson(Map<String, dynamic> json) => ContactHistory(
        date: ApiName.fromJson(json["Date"]),
        time: ApiName.fromJson(json["Time"]),
        user: ApiName.fromJson(json["User"]),
        appointmentId: ApiName.fromJson(json["AppointmentID"]),
        action: ApiName.fromJson(json["Action"]),
        notes: ApiName.fromJson(json["Notes"]),
      );

  Map<String, dynamic> toJson() => {
        "Date": date!.toJson(),
        "Time": time!.toJson(),
        "User": user!.toJson(),
        "AppointmentID": appointmentId!.toJson(),
        "Action": action!.toJson(),
        "Notes": notes!.toJson(),
      };
}

class CustomerDetails {
  CustomerDetails({
    this.dataConsent,
    this.customerTitle,
    this.customerForename,
    this.customerSurname,
    this.customerCompanyName,
    this.customerBuildingName,
    this.customerStreet,
    this.customerAddressArea,
    this.customerAddressTown,
    this.customerCounty,
    this.customerPostcode,
    this.customerHomeTelNo,
    this.customerWorkTelNo,
    this.customerMobileNo,
    this.customerAlternateMobileNo,
    this.customerEmailAddress,
    this.generalInstructions,
    this.jobNotes,
    this.useCollectionAddress,
    this.collectionBuildingName,
    this.collectionCompanyName,
    this.collectionStreet,
    this.collectionAddressArea,
    this.collectionAddressTown,
    this.collectionCounty,
    this.collectionPostCode,
    this.collectionContactNumber,
    this.apptLatitude,
    this.apptLongitude,
  });

  ApiName? dataConsent;
  ApiName? customerTitle;
  DisclaimerText? customerForename;
  ApiName? customerSurname;
  DisclaimerText? customerCompanyName;
  DisclaimerText? customerBuildingName;
  ApiName? customerStreet;
  DisclaimerText? customerAddressArea;
  DisclaimerText? customerAddressTown;
  DisclaimerText? customerCounty;
  ApiName? customerPostcode;
  DisclaimerText? customerHomeTelNo;
  DisclaimerText? customerWorkTelNo;
  ApiName? customerMobileNo;
  DisclaimerText? customerAlternateMobileNo;
  ApiName? customerEmailAddress;
  DisclaimerText? generalInstructions;
  DisclaimerText? jobNotes;
  ApiName? useCollectionAddress;
  DisclaimerText? collectionBuildingName;
  DisclaimerText? collectionCompanyName;
  ApiName? collectionStreet;
  DisclaimerText? collectionAddressArea;
  DisclaimerText? collectionAddressTown;
  DisclaimerText? collectionCounty;
  ApiName? collectionPostCode;
  ApiName? collectionContactNumber;
  ApiName? apptLatitude;
  ApiName? apptLongitude;

  factory CustomerDetails.fromJson(Map<String, dynamic> json) => CustomerDetails(
        dataConsent: ApiName.fromJson(json["DataConsent"]),
        customerTitle: ApiName.fromJson(json["CustomerTitle"]),
        customerForename: DisclaimerText.fromJson(json["CustomerForename"]),
        customerSurname: ApiName.fromJson(json["CustomerSurname"]),
        customerCompanyName: DisclaimerText.fromJson(json["CustomerCompanyName"]),
        customerBuildingName: DisclaimerText.fromJson(json["CustomerBuildingName"]),
        customerStreet: ApiName.fromJson(json["CustomerStreet"]),
        customerAddressArea: DisclaimerText.fromJson(json["CustomerAddressArea"]),
        customerAddressTown: DisclaimerText.fromJson(json["CustomerAddressTown"]),
        customerCounty: DisclaimerText.fromJson(json["CustomerCounty"]),
        customerPostcode: ApiName.fromJson(json["CustomerPostcode"]),
        customerHomeTelNo: DisclaimerText.fromJson(json["CustomerHomeTelNo"]),
        customerWorkTelNo: DisclaimerText.fromJson(json["CustomerWorkTelNo"]),
        customerMobileNo: ApiName.fromJson(json["CustomerMobileNo"]),
        customerAlternateMobileNo: DisclaimerText.fromJson(json["CustomerAlternateMobileNo"]),
        customerEmailAddress: ApiName.fromJson(json["CustomerEmailAddress"]),
        generalInstructions: DisclaimerText.fromJson(json["GeneralInstructions"]),
        jobNotes: DisclaimerText.fromJson(json["JobNotes"]),
        useCollectionAddress: ApiName.fromJson(json["UseCollectionAddress"]),
        collectionBuildingName: DisclaimerText.fromJson(json["CollectionBuildingName"]),
        collectionCompanyName: DisclaimerText.fromJson(json["CollectionCompanyName"]),
        collectionStreet: ApiName.fromJson(json["CollectionStreet"]),
        collectionAddressArea: DisclaimerText.fromJson(json["CollectionAddressArea"]),
        collectionAddressTown: DisclaimerText.fromJson(json["CollectionAddressTown"]),
        collectionCounty: DisclaimerText.fromJson(json["CollectionCounty"]),
        collectionPostCode: ApiName.fromJson(json["CollectionPostCode"]),
        collectionContactNumber: ApiName.fromJson(json["CollectionContactNumber"]),
        apptLatitude: ApiName.fromJson(json["ApptLatitude"]),
        apptLongitude: ApiName.fromJson(json["ApptLongitude"]),
      );

  Map<String, dynamic> toJson() => {
        "DataConsent": dataConsent!.toJson(),
        "CustomerTitle": customerTitle!.toJson(),
        "CustomerForename": customerForename!.toJson(),
        "CustomerSurname": customerSurname!.toJson(),
        "CustomerCompanyName": customerCompanyName!.toJson(),
        "CustomerBuildingName": customerBuildingName!.toJson(),
        "CustomerStreet": customerStreet!.toJson(),
        "CustomerAddressArea": customerAddressArea!.toJson(),
        "CustomerAddressTown": customerAddressTown!.toJson(),
        "CustomerCounty": customerCounty!.toJson(),
        "CustomerPostcode": customerPostcode!.toJson(),
        "CustomerHomeTelNo": customerHomeTelNo!.toJson(),
        "CustomerWorkTelNo": customerWorkTelNo!.toJson(),
        "CustomerMobileNo": customerMobileNo!.toJson(),
        "CustomerAlternateMobileNo": customerAlternateMobileNo!.toJson(),
        "CustomerEmailAddress": customerEmailAddress!.toJson(),
        "GeneralInstructions": generalInstructions!.toJson(),
        "JobNotes": jobNotes!.toJson(),
        "UseCollectionAddress": useCollectionAddress!.toJson(),
        "CollectionBuildingName": collectionBuildingName!.toJson(),
        "CollectionCompanyName": collectionCompanyName!.toJson(),
        "CollectionStreet": collectionStreet!.toJson(),
        "CollectionAddressArea": collectionAddressArea!.toJson(),
        "CollectionAddressTown": collectionAddressTown!.toJson(),
        "CollectionCounty": collectionCounty!.toJson(),
        "CollectionPostCode": collectionPostCode!.toJson(),
        "CollectionContactNumber": collectionContactNumber!.toJson(),
        "ApptLatitude": apptLatitude!.toJson(),
        "ApptLongitude": apptLongitude!.toJson(),
      };
}

class FaultReport {
  FaultReport({
    this.faultDescription,
     this.faultHistories,
  });

  ApiName? faultDescription;
   FaultHistories? faultHistories;

  factory FaultReport.fromJson(Map<String, dynamic> json) => FaultReport(
        faultDescription: ApiName.fromJson(json["FaultDescription"]),
        // faultHistories: FaultHistories.fromJson(json["FaultHistories"]),
      );

  Map<String, dynamic> toJson() => {
        "FaultDescription": faultDescription!.toJson(),
        "FaultHistories": faultHistories!.toJson(),
      };
}

class FaultHistories {
  FaultHistories({
    this.faultHistory,
  });

  List<FaultHistory>? faultHistory;

  factory FaultHistories.fromJson(Map<String, dynamic> json) => FaultHistories(
        // faultHistory:
        //     List<FaultHistory>.from(json["FaultHistory"] != null ? [FaultHistory.fromJson(json["FaultHistory"])] : []),
            faultHistory:
            List<FaultHistory>.from([FaultHistory.fromJson(json["FaultHistory"])]).toList()
      );

  Map<String, dynamic> toJson() => {
        "FaultHistory": List<dynamic>.from(faultHistory!.map((x) => x.toJson())),
      };
}

class FaultHistory {
  FaultHistory({
    this.hisJobNo,
    this.hisCompletedDate,
    this.hisCompletionStatus,
    this.hisJobNotes,
    this.hisContactHistories,
    this.hisFaultDate,
    this.hisEngineer,
    this.hisFaultDescription,
    this.hisDescriptionOfRepair,
    this.faultHistoryParts,
  });

  ApiName? hisJobNo;
  ApiName? hisCompletedDate;
  DisclaimerText? hisCompletionStatus;
  DisclaimerText? hisJobNotes;
  dynamic hisContactHistories;
  ApiName? hisFaultDate;
  ApiName? hisEngineer;
  ApiName? hisFaultDescription;
  DisclaimerText? hisDescriptionOfRepair;
  DisclaimerText? faultHistoryParts;

  factory FaultHistory.fromJson(Map<String, dynamic> json) => FaultHistory(
        hisJobNo: ApiName.fromJson(json["HisJobNo"]),
        hisCompletedDate: ApiName.fromJson(json["HisCompletedDate"]),
        hisCompletionStatus: DisclaimerText.fromJson(json["HisCompletionStatus"]),
        hisJobNotes: DisclaimerText.fromJson(json["HisJobNotes"]),
        hisContactHistories: json["HisContactHistories"],
        hisFaultDate: ApiName.fromJson(json["HisFaultDate"]),
        hisEngineer: ApiName.fromJson(json["HisEngineer"]),
        hisFaultDescription: ApiName.fromJson(json["HisFaultDescription"]),
        hisDescriptionOfRepair: DisclaimerText.fromJson(json["HisDescriptionOfRepair"]),
        faultHistoryParts: DisclaimerText.fromJson(json["FaultHistoryParts"]),
      );

  Map<String, dynamic> toJson() => {
        "HisJobNo": hisJobNo!.toJson(),
        "HisCompletedDate": hisCompletedDate!.toJson(),
        "HisCompletionStatus": hisCompletionStatus!.toJson(),
        "HisJobNotes": hisJobNotes!.toJson(),
        "HisContactHistories": hisContactHistories,
        "HisFaultDate": hisFaultDate!.toJson(),
        "HisEngineer": hisEngineer!.toJson(),
        "HisFaultDescription": hisFaultDescription!.toJson(),
        "HisDescriptionOfRepair": hisDescriptionOfRepair!.toJson(),
        "FaultHistoryParts": faultHistoryParts!.toJson(),
      };
}

class HisContactHistor {
  HisContactHistor({
    this.hisAction,
    this.hisContactNote,
    this.hisContactDate,
    this.hisContactTime,
    this.hisContactUser,
  });

  ApiName? hisAction;
  ApiName? hisContactNote;
  ApiName? hisContactDate;
  ApiName? hisContactTime;
  ApiName? hisContactUser;

  factory HisContactHistor.fromJson(Map<String, dynamic> json) => HisContactHistor(
        hisAction: ApiName.fromJson(json["HisAction"]),
        hisContactNote: ApiName.fromJson(json["HisContactNote"]),
        hisContactDate: ApiName.fromJson(json["HisContactDate"]),
        hisContactTime: ApiName.fromJson(json["HisContactTime"]),
        hisContactUser: ApiName.fromJson(json["HisContactUser"]),
      );

  Map<String, dynamic> toJson() => {
        "HisAction": hisAction!.toJson(),
        "HisContactNote": hisContactNote!.toJson(),
        "HisContactDate": hisContactDate!.toJson(),
        "HisContactTime": hisContactTime!.toJson(),
        "HisContactUser": hisContactUser!.toJson(),
      };
}

class JobDetails {
  JobDetails({
    this.appointmentTime,
    this.jobNo,
    this.slJobNo,
    this.argosSparesManagement,
    this.clientNumber,
    this.incidentNumber,
    this.repairType,
    this.estimateRequired,
    this.estimateStatus,
    this.estimateIfOver,
    this.estimateAccepted,
    this.estimateRejected,
    this.appointmentNotes,
    this.warrantyJob,
    this.jobTypeId,
    this.previousVisits,
    this.descriptionOfRepair,
    this.displayChargeableCosts,
    this.chargeableLabourCost,
    this.chargeablePartsCost,
    this.collectionDeliveryCost,
    this.chargeableVatCost,
    this.chargeableTotalCost,
    this.chargeableTotalPaid,
    this.chargeableRefund,
    this.chargableBalanceDue,
    this.jobCostId,
    this.chargeableLabourVatCost,
    this.chargeableSubTotal,
    this.chargeableInvoiceNumber,
    this.chargeableInvoiceDate,
    this.chargeablePriceLock,
    this.chargeableNetworkManagerOverride,
    this.chargeableComments,
    this.chargeableApproved,
    this.chargeableModifiedBy,
    this.loanApproved,
    this.appointmentWindow,
    this.travelTime,
    this.duration,
    this.preVisit,
    this.network,
    this.networkId,
    this.client,
    this.clientId,
    this.branch,
    this.branchId,
    this.branchOpenTime,
    this.branchCloseTime,
    this.repeatRepair,
    this.serviceTypeId1,
    this.serviceTypeName1,
    this.dgJobFaultCode,
    this.serviceTypeIDs,
    this.repairSkillId,
  });

  DisclaimerText? appointmentTime;
  ApiName? jobNo;
  ApiName? slJobNo;
  ApiName? argosSparesManagement;
  DisclaimerText? clientNumber;
  DisclaimerText? incidentNumber;
  ApiName? repairType;
  ApiName? estimateRequired;
  DisclaimerText? estimateStatus;
  ApiName? estimateIfOver;
  ApiName? estimateAccepted;
  ApiName? estimateRejected;
  DisclaimerText? appointmentNotes;
  ApiName? warrantyJob;
  ApiName? jobTypeId;
  ApiName? previousVisits;
  DisclaimerText? descriptionOfRepair;
  ApiName? displayChargeableCosts;
  ApiName? chargeableLabourCost;
  ApiName? chargeablePartsCost;
  ApiName? collectionDeliveryCost;
  ApiName? chargeableVatCost;
  ApiName? chargeableTotalCost;
  ApiName? chargeableTotalPaid;
  ApiName? chargeableRefund;
  ApiName? chargableBalanceDue;
  ApiName? jobCostId;
  ApiName? chargeableLabourVatCost;
  ApiName? chargeableSubTotal;
  DisclaimerText? chargeableInvoiceNumber;
  DisclaimerText? chargeableInvoiceDate;
  ApiName? chargeablePriceLock;
  ApiName? chargeableNetworkManagerOverride;
  ApiName? chargeableComments;
  ApiName? chargeableApproved;
  ApiName? chargeableModifiedBy;
  DisclaimerText? loanApproved;
  ApiName? appointmentWindow;
  DisclaimerText? travelTime;
  ApiName? duration;
  ApiName? preVisit;
  ApiName? network;
  ApiName? networkId;
  ApiName? client;
  ApiName? clientId;
  ApiName? branch;
  ApiName? branchId;
  ApiName? branchOpenTime;
  ApiName? branchCloseTime;
  ApiName? repeatRepair;
  ApiName? serviceTypeId1;
  ApiName? serviceTypeName1;
  DisclaimerText? dgJobFaultCode;
  ServiceTypeIDs? serviceTypeIDs;
  ApiName? repairSkillId;

  factory JobDetails.fromJson(Map<String, dynamic> json) => JobDetails(
        appointmentTime: DisclaimerText.fromJson(json["AppointmentTime"]),
        jobNo: ApiName.fromJson(json["JobNo"]),
        slJobNo: ApiName.fromJson(json["SLJobNo"]),
        argosSparesManagement: ApiName.fromJson(json["ArgosSparesManagement"]),
        clientNumber: DisclaimerText.fromJson(json["ClientNumber"]),
        incidentNumber: DisclaimerText.fromJson(json["IncidentNumber"]),
        repairType: ApiName.fromJson(json["RepairType"]),
        estimateRequired: ApiName.fromJson(json["EstimateRequired"]),
        estimateStatus: DisclaimerText.fromJson(json["EstimateStatus"]),
        estimateIfOver: ApiName.fromJson(json["EstimateIfOver"]),
        estimateAccepted: ApiName.fromJson(json["EstimateAccepted"]),
        estimateRejected: ApiName.fromJson(json["EstimateRejected"]),
        appointmentNotes: DisclaimerText.fromJson(json["AppointmentNotes"]),
        warrantyJob: ApiName.fromJson(json["WarrantyJob"]),
        jobTypeId: ApiName.fromJson(json["JobTypeID"]),
        previousVisits: ApiName.fromJson(json["PreviousVisits"]),
        descriptionOfRepair: DisclaimerText.fromJson(json["DescriptionOfRepair"]),
        displayChargeableCosts: ApiName.fromJson(json["DisplayChargeableCosts"]),
        chargeableLabourCost: ApiName.fromJson(json["ChargeableLabourCost"]),
        chargeablePartsCost: ApiName.fromJson(json["ChargeablePartsCost"]),
        collectionDeliveryCost: ApiName.fromJson(json["CollectionDeliveryCost"]),
        chargeableVatCost: ApiName.fromJson(json["ChargeableVATCost"]),
        chargeableTotalCost: ApiName.fromJson(json["ChargeableTotalCost"]),
        chargeableTotalPaid: ApiName.fromJson(json["ChargeableTotalPaid"]),
        chargeableRefund: ApiName.fromJson(json["ChargeableRefund"]),
        chargableBalanceDue: ApiName.fromJson(json["ChargableBalanceDue"]),
        jobCostId: ApiName.fromJson(json["JobCostID"]),
        chargeableLabourVatCost: ApiName.fromJson(json["ChargeableLabourVATCost"]),
        chargeableSubTotal: ApiName.fromJson(json["ChargeableSubTotal"]),
        chargeableInvoiceNumber: DisclaimerText.fromJson(json["ChargeableInvoiceNumber"]),
        chargeableInvoiceDate: DisclaimerText.fromJson(json["ChargeableInvoiceDate"]),
        chargeablePriceLock: ApiName.fromJson(json["ChargeablePriceLock"]),
        chargeableNetworkManagerOverride: ApiName.fromJson(json["ChargeableNetworkManagerOverride"]),
        chargeableComments: ApiName.fromJson(json["ChargeableComments"]),
        chargeableApproved: ApiName.fromJson(json["ChargeableApproved"]),
        chargeableModifiedBy: ApiName.fromJson(json["ChargeableModifiedBy"]),
        loanApproved: DisclaimerText.fromJson(json["LoanApproved"]),
        appointmentWindow: ApiName.fromJson(json["AppointmentWindow"]),
        travelTime: DisclaimerText.fromJson(json["TravelTime"]),
        duration: ApiName.fromJson(json["Duration"]),
        preVisit: ApiName.fromJson(json["PreVisit"]),
        network: ApiName.fromJson(json["Network"]),
        networkId: ApiName.fromJson(json["NetworkID"]),
        client: ApiName.fromJson(json["Client"]),
        clientId: ApiName.fromJson(json["ClientID"]),
        branch: ApiName.fromJson(json["Branch"]),
        branchId: ApiName.fromJson(json["BranchID"]),
        branchOpenTime: ApiName.fromJson(json["BranchOpenTime"]),
        branchCloseTime: ApiName.fromJson(json["BranchCloseTime"]),
        repeatRepair: ApiName.fromJson(json["RepeatRepair"]),
        serviceTypeId1: ApiName.fromJson(json["ServiceTypeID1"]),
        serviceTypeName1: ApiName.fromJson(json["ServiceTypeName1"]),
        dgJobFaultCode: DisclaimerText.fromJson(json["DGJobFaultCode"]),
        serviceTypeIDs: ServiceTypeIDs.fromJson(json["ServiceTypeIDs"]),
        repairSkillId: ApiName.fromJson(json["RepairSkillID"]),
      );

  Map<String, dynamic> toJson() => {
        "AppointmentTime": appointmentTime!.toJson(),
        "JobNo": jobNo!.toJson(),
        "SLJobNo": slJobNo!.toJson(),
        "ArgosSparesManagement": argosSparesManagement!.toJson(),
        "ClientNumber": clientNumber!.toJson(),
        "IncidentNumber": incidentNumber!.toJson(),
        "RepairType": repairType!.toJson(),
        "EstimateRequired": estimateRequired!.toJson(),
        "EstimateStatus": estimateStatus!.toJson(),
        "EstimateIfOver": estimateIfOver!.toJson(),
        "EstimateAccepted": estimateAccepted!.toJson(),
        "EstimateRejected": estimateRejected!.toJson(),
        "AppointmentNotes": appointmentNotes!.toJson(),
        "WarrantyJob": warrantyJob!.toJson(),
        "JobTypeID": jobTypeId!.toJson(),
        "PreviousVisits": previousVisits!.toJson(),
        "DescriptionOfRepair": descriptionOfRepair!.toJson(),
        "DisplayChargeableCosts": displayChargeableCosts!.toJson(),
        "ChargeableLabourCost": chargeableLabourCost!.toJson(),
        "ChargeablePartsCost": chargeablePartsCost!.toJson(),
        "CollectionDeliveryCost": collectionDeliveryCost!.toJson(),
        "ChargeableVATCost": chargeableVatCost!.toJson(),
        "ChargeableTotalCost": chargeableTotalCost!.toJson(),
        "ChargeableTotalPaid": chargeableTotalPaid!.toJson(),
        "ChargeableRefund": chargeableRefund!.toJson(),
        "ChargableBalanceDue": chargableBalanceDue!.toJson(),
        "JobCostID": jobCostId!.toJson(),
        "ChargeableLabourVATCost": chargeableLabourVatCost!.toJson(),
        "ChargeableSubTotal": chargeableSubTotal!.toJson(),
        "ChargeableInvoiceNumber": chargeableInvoiceNumber!.toJson(),
        "ChargeableInvoiceDate": chargeableInvoiceDate!.toJson(),
        "ChargeablePriceLock": chargeablePriceLock!.toJson(),
        "ChargeableNetworkManagerOverride": chargeableNetworkManagerOverride!.toJson(),
        "ChargeableComments": chargeableComments!.toJson(),
        "ChargeableApproved": chargeableApproved!.toJson(),
        "ChargeableModifiedBy": chargeableModifiedBy!.toJson(),
        "LoanApproved": loanApproved!.toJson(),
        "AppointmentWindow": appointmentWindow!.toJson(),
        "TravelTime": travelTime!.toJson(),
        "Duration": duration!.toJson(),
        "PreVisit": preVisit!.toJson(),
        "Network": network!.toJson(),
        "NetworkID": networkId!.toJson(),
        "Client": client!.toJson(),
        "ClientID": clientId!.toJson(),
        "Branch": branch!.toJson(),
        "BranchID": branchId!.toJson(),
        "BranchOpenTime": branchOpenTime!.toJson(),
        "BranchCloseTime": branchCloseTime!.toJson(),
        "RepeatRepair": repeatRepair!.toJson(),
        "ServiceTypeID1": serviceTypeId1!.toJson(),
        "ServiceTypeName1": serviceTypeName1!.toJson(),
        "DGJobFaultCode": dgJobFaultCode!.toJson(),
        "ServiceTypeIDs": serviceTypeIDs!.toJson(),
        "RepairSkillID": repairSkillId!.toJson(),
      };
}

class ServiceTypeIDs {
  ServiceTypeIDs({
    this.serviceTypeId,
  });

  List<ApiName>? serviceTypeId;

  factory ServiceTypeIDs.fromJson(Map<String, dynamic> json) => ServiceTypeIDs(
        serviceTypeId: List<ApiName>.from(json["ServiceTypeID"].map((e) => ApiName.fromJson(e))),
      );

  Map<String, dynamic> toJson() => {
        "ServiceTypeID": List<dynamic>.from(serviceTypeId!.map((x) => x.toJson())),
      };
}

class ServiceHistory {
  ServiceHistory({
    this.descriptionOfRepair,
  });

  DisclaimerText? descriptionOfRepair;

  factory ServiceHistory.fromJson(Map<String, dynamic> json) => ServiceHistory(
        descriptionOfRepair: DisclaimerText.fromJson(json["DescriptionOfRepair"]),
      );

  Map<String, dynamic> toJson() => {
        "DescriptionOfRepair": descriptionOfRepair!.toJson(),
      };
}

class UnitDetails {
  UnitDetails({
    this.make,
    this.manufacturerId,
    this.model,
    this.modelId,
    this.unitType,
    this.gcNumber,
    this.productNo,
    this.serialNo,
    this.dop,
    this.oldFirmwareVersion,
    this.newFirmwareVersion,
    this.catalogueNo,
    this.unitCondition,
    this.unitLocation,
    this.accessories,
    this.loanUnitNumber,
    this.loanUnitManufacturer,
    this.loanUnitModelNumber,
    this.loanAccessoryList,
    this.jobAccessoryList,
    this.productPremisesLocation,
  });

  ApiName? make;
  ApiName? manufacturerId;
  ApiName? model;
  ApiName? modelId;
  ApiName? unitType;
  DisclaimerText? gcNumber;
  DisclaimerText? productNo;
  DisclaimerText? serialNo;
  DisclaimerText? dop;
  DisclaimerText? oldFirmwareVersion;
  DisclaimerText? newFirmwareVersion;
  DisclaimerText? catalogueNo;
  DisclaimerText? unitCondition;
  DisclaimerText? unitLocation;
  DisclaimerText? accessories;
  DisclaimerText? loanUnitNumber;
  DisclaimerText? loanUnitManufacturer;
  DisclaimerText? loanUnitModelNumber;
  DisclaimerText? loanAccessoryList;
  DisclaimerText? jobAccessoryList;
  DisclaimerText? productPremisesLocation;

  factory UnitDetails.fromJson(Map<String, dynamic> json) => UnitDetails(
        make: ApiName.fromJson(json["Make"]),
        manufacturerId: ApiName.fromJson(json["ManufacturerID"]),
        model: ApiName.fromJson(json["Model"]),
        modelId: ApiName.fromJson(json["ModelID"]),
        unitType: ApiName.fromJson(json["UnitType"]),
        gcNumber: DisclaimerText.fromJson(json["GCNumber"]),
        productNo: DisclaimerText.fromJson(json["ProductNo"]),
        serialNo: DisclaimerText.fromJson(json["SerialNo"]),
        dop: DisclaimerText.fromJson(json["DOP"]),
        oldFirmwareVersion: DisclaimerText.fromJson(json["OldFirmwareVersion"]),
        newFirmwareVersion: DisclaimerText.fromJson(json["NewFirmwareVersion"]),
        catalogueNo: DisclaimerText.fromJson(json["CatalogueNo"]),
        unitCondition: DisclaimerText.fromJson(json["UnitCondition"]),
        unitLocation: DisclaimerText.fromJson(json["UnitLocation"]),
        accessories: DisclaimerText.fromJson(json["Accessories"]),
        loanUnitNumber: DisclaimerText.fromJson(json["LoanUnitNumber"]),
        loanUnitManufacturer: DisclaimerText.fromJson(json["LoanUnitManufacturer"]),
        loanUnitModelNumber: DisclaimerText.fromJson(json["LoanUnitModelNumber"]),
        loanAccessoryList: DisclaimerText.fromJson(json["LoanAccessoryList"]),
        jobAccessoryList: DisclaimerText.fromJson(json["JobAccessoryList"]),
        productPremisesLocation: DisclaimerText.fromJson(json["ProductPremisesLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "Make": make!.toJson(),
        "ManufacturerID": manufacturerId!.toJson(),
        "Model": model!.toJson(),
        "ModelID": modelId!.toJson(),
        "UnitType": unitType!.toJson(),
        "GCNumber": gcNumber!.toJson(),
        "ProductNo": productNo!.toJson(),
        "SerialNo": serialNo!.toJson(),
        "DOP": dop!.toJson(),
        "OldFirmwareVersion": oldFirmwareVersion!.toJson(),
        "NewFirmwareVersion": newFirmwareVersion!.toJson(),
        "CatalogueNo": catalogueNo!.toJson(),
        "UnitCondition": unitCondition!.toJson(),
        "UnitLocation": unitLocation!.toJson(),
        "Accessories": accessories!.toJson(),
        "LoanUnitNumber": loanUnitNumber!.toJson(),
        "LoanUnitManufacturer": loanUnitManufacturer!.toJson(),
        "LoanUnitModelNumber": loanUnitModelNumber!.toJson(),
        "LoanAccessoryList": loanAccessoryList!.toJson(),
        "JobAccessoryList": jobAccessoryList!.toJson(),
        "ProductPremisesLocation": productPremisesLocation!.toJson(),
      };
}

class WarrantyDetails {
  WarrantyDetails({
    this.chargeType,
    this.jobType,
    this.originalRetailer,
    this.insurer,
    this.policyNo,
    this.authorisationNumber,
    this.policyEndDate,
    this.fraudAlert,
    this.warrantyNotes,
  });

  ApiName? chargeType;
  DisclaimerText? jobType;
  DisclaimerText? originalRetailer;
  DisclaimerText? insurer;
  DisclaimerText? policyNo;
  DisclaimerText? authorisationNumber;
  ApiName? policyEndDate;
  DisclaimerText? fraudAlert;
  DisclaimerText? warrantyNotes;

  factory WarrantyDetails.fromJson(Map<String, dynamic> json) => WarrantyDetails(
        chargeType: ApiName.fromJson(json["ChargeType"]),
        jobType: DisclaimerText.fromJson(json["JobType"]),
        originalRetailer: DisclaimerText.fromJson(json["OriginalRetailer"]),
        insurer: DisclaimerText.fromJson(json["Insurer"]),
        policyNo: DisclaimerText.fromJson(json["PolicyNo"]),
        authorisationNumber: DisclaimerText.fromJson(json["AuthorisationNumber"]),
        policyEndDate: ApiName.fromJson(json["PolicyEndDate"]),
        fraudAlert: DisclaimerText.fromJson(json["FraudAlert"]),
        warrantyNotes: DisclaimerText.fromJson(json["WarrantyNotes"]),
      );

  Map<String, dynamic> toJson() => {
        "ChargeType": chargeType!.toJson(),
        "JobType": jobType!.toJson(),
        "OriginalRetailer": originalRetailer!.toJson(),
        "Insurer": insurer!.toJson(),
        "PolicyNo": policyNo!.toJson(),
        "AuthorisationNumber": authorisationNumber!.toJson(),
        "PolicyEndDate": policyEndDate!.toJson(),
        "FraudAlert": fraudAlert!.toJson(),
        "WarrantyNotes": warrantyNotes!.toJson(),
      };
}

class Defaults {
  Defaults({
    this.fullName,
    // this.startTime,
    // this.finishTime,
    this.slUsername,
    this.slPassword,
    this.disclaimerText,
  });

  ApiName? fullName;
  // ApiName? startTime;
  // ApiName? finishTime;
  ApiName? slUsername;
  ApiName? slPassword;
  DisclaimerText? disclaimerText;

  factory Defaults.fromJson(Map<String, dynamic> json) => Defaults(
        fullName: ApiName.fromJson(json["FullName"]),
        // startTime: ApiName.fromJson(json["StartTime"]),
        // finishTime: ApiName.fromJson(json["FinishTime"]),
        slUsername: ApiName.fromJson(json["SLUsername"]),
        slPassword: ApiName.fromJson(json["SLPassword"]),
        disclaimerText: DisclaimerText.fromJson(json["DisclaimerText"]),
      );
      bool checkIfAnyIsNull() {
    return [fullName,  slUsername, slPassword, disclaimerText].contains(null);
  }

  Map<String, dynamic> toJson() => {
        "FullName": fullName!.toJson(),
        // "StartTime": startTime!.toJson(),
        // "FinishTime": finishTime!.toJson(),
        "SLUsername": slUsername!.toJson(),
        "SLPassword": slPassword!.toJson(),
        "DisclaimerText": disclaimerText!.toJson(),
      };
}
