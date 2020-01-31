// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    String id;
    String nombreUsuario;
    String usuarioContrasea;

    Usuario({
        this.id,
        this.nombreUsuario,
        this.usuarioContrasea,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        nombreUsuario: json["nombreUsuario"],
        usuarioContrasea: json["usuarioContraseña"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nombreUsuario": nombreUsuario,
        "usuarioContraseña": usuarioContrasea,
    };
}
