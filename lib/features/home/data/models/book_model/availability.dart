class Availability {
  String? status;
  bool? availableToBrowse;
  bool? availableToBorrow;
  bool? availableToWaitlist;
  bool? isPrintdisabled;
  bool? isReadable;
  bool? isLendable;
  bool? isPreviewable;
  String? identifier;
  dynamic isbn;
  dynamic oclc;
  String? openlibraryWork;
  String? openlibraryEdition;
  dynamic lastLoanDate;
  dynamic numWaitlist;
  dynamic lastWaitlistDate;
  bool? isRestricted;
  bool? isBrowseable;
  String? src;

  Availability({
    this.status,
    this.availableToBrowse,
    this.availableToBorrow,
    this.availableToWaitlist,
    this.isPrintdisabled,
    this.isReadable,
    this.isLendable,
    this.isPreviewable,
    this.identifier,
    this.isbn,
    this.oclc,
    this.openlibraryWork,
    this.openlibraryEdition,
    this.lastLoanDate,
    this.numWaitlist,
    this.lastWaitlistDate,
    this.isRestricted,
    this.isBrowseable,
    this.src,
  });

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
    status: json['status'] as String?,
    availableToBrowse: json['available_to_browse'] as bool?,
    availableToBorrow: json['available_to_borrow'] as bool?,
    availableToWaitlist: json['available_to_waitlist'] as bool?,
    isPrintdisabled: json['is_printdisabled'] as bool?,
    isReadable: json['is_readable'] as bool?,
    isLendable: json['is_lendable'] as bool?,
    isPreviewable: json['is_previewable'] as bool?,
    identifier: json['identifier'] as String?,
    isbn: json['isbn'] as dynamic,
    oclc: json['oclc'] as dynamic,
    openlibraryWork: json['openlibrary_work'] as String?,
    openlibraryEdition: json['openlibrary_edition'] as String?,
    lastLoanDate: json['last_loan_date'] as dynamic,
    numWaitlist: json['num_waitlist'] as dynamic,
    lastWaitlistDate: json['last_waitlist_date'] as dynamic,
    isRestricted: json['is_restricted'] as bool?,
    isBrowseable: json['is_browseable'] as bool?,
    src: json['__src__'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'available_to_browse': availableToBrowse,
    'available_to_borrow': availableToBorrow,
    'available_to_waitlist': availableToWaitlist,
    'is_printdisabled': isPrintdisabled,
    'is_readable': isReadable,
    'is_lendable': isLendable,
    'is_previewable': isPreviewable,
    'identifier': identifier,
    'isbn': isbn,
    'oclc': oclc,
    'openlibrary_work': openlibraryWork,
    'openlibrary_edition': openlibraryEdition,
    'last_loan_date': lastLoanDate,
    'num_waitlist': numWaitlist,
    'last_waitlist_date': lastWaitlistDate,
    'is_restricted': isRestricted,
    'is_browseable': isBrowseable,
    '__src__': src,
  };
}
