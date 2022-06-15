class reservationmodel {
  String reserveruid;
  String hostuid;
  String housetitle;
  String houseuid;
  int guests;
  String datefrom;
  String dateto;
  int totalfee;

  reservationmodel(this.housetitle, this.hostuid, this.houseuid,
      this.reserveruid, this.datefrom, this.guests, this.totalfee, this.dateto);

  checkifvalid() {
    if (reserveruid != "" &&
        hostuid != "" &&
        housetitle != "" &&
        houseuid != "" &&
        guests != 0 &&
        datefrom != "" &&
        dateto != "" &&
        totalfee != 0) {
      return true;
    } else {
      return false;
    }
  }
}
