class OrgEntry {
  int? _count;
  List<Entries>? _entries;

  OrgEntry({int? count, List<Entries>? entries}) {
    if (count != null) {
      this._count = count;
    }
    if (entries != null) {
      this._entries = entries;
    }
  }

  int? get count => _count;
  set count(int? count) => _count = count;
  List<Entries>? get entries => _entries;
  set entries(List<Entries>? entries) => _entries = entries;

  OrgEntry.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['entries'] != null) {
      _entries = <Entries>[];
      json['entries'].forEach((v) {
        _entries!.add(new Entries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._entries != null) {
      data['entries'] = this._entries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entries {
  String? _aPI;
  String? _description;
  String? _auth;
  bool? _hTTPS;
  String? _cors;
  String? _link;
  String? _category;

  Entries(
      {String? aPI,
        String? description,
        String? auth,
        bool? hTTPS,
        String? cors,
        String? link,
        String? category}) {
    if (aPI != null) {
      this._aPI = aPI;
    }
    if (description != null) {
      this._description = description;
    }
    if (auth != null) {
      this._auth = auth;
    }
    if (hTTPS != null) {
      this._hTTPS = hTTPS;
    }
    if (cors != null) {
      this._cors = cors;
    }
    if (link != null) {
      this._link = link;
    }
    if (category != null) {
      this._category = category;
    }
  }

  String? get aPI => _aPI;
  set aPI(String? aPI) => _aPI = aPI;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get auth => _auth;
  set auth(String? auth) => _auth = auth;
  bool? get hTTPS => _hTTPS;
  set hTTPS(bool? hTTPS) => _hTTPS = hTTPS;
  String? get cors => _cors;
  set cors(String? cors) => _cors = cors;
  String? get link => _link;
  set link(String? link) => _link = link;
  String? get category => _category;
  set category(String? category) => _category = category;

  Entries.fromJson(Map<String, dynamic> json) {
    _aPI = json['API'];
    _description = json['Description'];
    _auth = json['Auth'];
    _hTTPS = json['HTTPS'];
    _cors = json['Cors'];
    _link = json['Link'];
    _category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['API'] = this._aPI;
    data['Description'] = this._description;
    data['Auth'] = this._auth;
    data['HTTPS'] = this._hTTPS;
    data['Cors'] = this._cors;
    data['Link'] = this._link;
    data['Category'] = this._category;
    return data;
  }
}