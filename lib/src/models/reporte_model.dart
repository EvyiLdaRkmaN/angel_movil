// To parse this JSON data, do
//
//     final reporte = reporteFromJson(jsonString);

import 'dart:convert';

Reporte reporteFromJson(String str) => Reporte.fromJson(json.decode(str));

String reporteToJson(Reporte data) => json.encode(data.toJson());

class Reporte {
    String localidad;
    String reportePeticion;
    String reporteObjetivo;
    String reportePrioridad;

    Reporte({
        this.localidad,
        this.reportePeticion,
        this.reporteObjetivo,
        this.reportePrioridad,
    });

    factory Reporte.fromJson(Map<String, dynamic> json) => Reporte(
        localidad: json["localidad"],
        reportePeticion: json["reportePeticion"],
        reporteObjetivo: json["reporteObjetivo"],
        reportePrioridad: json["reportePrioridad"],
    );

    Map<String, dynamic> toJson() => {
        "localidad": localidad,
        "reportePeticion": reportePeticion,
        "reporteObjetivo": reporteObjetivo,
        "reportePrioridad": reportePrioridad,
    };
}
