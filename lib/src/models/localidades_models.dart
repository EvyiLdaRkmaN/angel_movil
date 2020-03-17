// To parse this JSON data, do
//
//     final localidades = localidadesFromJson(jsonString);

import 'dart:convert';

Localidades localidadesFromJson(String str) => Localidades.fromJson(json.decode(str));

String localidadesToJson(Localidades data) => json.encode(data.toJson());

class Localidades {
    bool ok;
    List<Municipio> municipios;
    String mensaje;

    Localidades({
        this.ok,
        this.municipios,
        this.mensaje,
    });

    factory Localidades.fromJson(Map<String, dynamic> json) => Localidades(
        ok: json["ok"],
        municipios: List<Municipio>.from(json["municipios"].map((x) => Municipio.fromJson(x))),
        mensaje: json["Mensaje"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "municipios": List<dynamic>.from(municipios.map((x) => x.toJson())),
        "Mensaje": mensaje,
    };
}

class Municipio {
    String id;
    String nombreLocalidad;

    Municipio({
        this.id,
        this.nombreLocalidad,
    });

    factory Municipio.fromJson(Map<String, dynamic> json) => Municipio(
        id: json["_id"],
        nombreLocalidad: json["nombreLocalidad"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nombreLocalidad": nombreLocalidad,
    };
}
