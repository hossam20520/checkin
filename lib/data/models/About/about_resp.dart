class AboutResp{
  String? en_about;
  String? ar_about;
  String? en_term;
  String? ar_term;

  AboutResp({
    this.en_about,
    this.ar_about,
    this.en_term,
    this.ar_term});


  AboutResp.fromJson(Map<String, dynamic> json) {

    en_about = json['en_about'];
    ar_about = json['ar_about'];
    en_term = json['en_term'];
    ar_term = json['ar_term'];

  }




}