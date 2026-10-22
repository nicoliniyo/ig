Profile: PacienteGenerico
Parent: Patient
Id: patientgeneric-id
Title: "Paciente Genérico"
Description: "Perfil de Paciente Genérico de HL7 Core Online que incluye nacionalidad, tipo de documento, nombre oficial con apellido materno, nombre social, contacto e idioma."
* ^url = "https://hl7core.online/fhir/StructureDefinition/PacienteGenerico"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^date = "2026-10-21"
* ^publisher = "HL7 CORE - FHIR"
* ^contact.name = "HL7 Core"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "https://hl7coreonline.web.app"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "chair@hl7core.online"
* ^jurisdiction = urn:iso:std:iso:3166#BO "Bolivia"
* ^copyright = "HL7Core.online"

* extension contains Nacionalidad named nacionalidad 0..1 MS
* extension[nacionalidad] ^short = "Extensión de Nacionalidad para el paciente"

* identifier 1..* MS
* identifier ^short = "Listado de identificadores del paciente (CI, RUN, Pasaporte o Registro Clínico)"
* identifier.use MS
* identifier.type MS
* identifier.type from ValueSetTiposDocumentos (extensible)
* identifier.type ^short = "Tipo de documento de identidad (Extensible)"
* identifier.type.extension contains Nacionalidad named paises 0..1 MS
* identifier.type.extension[paises] ^short = "País de origen del documento de identidad"
* identifier.type.coding MS
* identifier.type.coding.system MS
* identifier.type.coding.code MS
* identifier.type.coding.display MS
* identifier.value 1..1 MS
* identifier.value ^short = "Número o valor de identificación"

* name 1..* MS
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "use"
* name ^slicing.description = "Diferencia el nombre oficial registrado frente al nombre social"
* name ^slicing.rules = #open
* name contains
    NombreOficial 1..1 MS and
    NombreSocial 0..1 MS

* name[NombreOficial] ^short = "Nombre registrado oficialmente del Paciente"
* name[NombreOficial].use 1..1 MS
* name[NombreOficial].use = #official
* name[NombreOficial].family 1..1 MS
* name[NombreOficial].family ^short = "Primer Apellido"
* name[NombreOficial].family.extension contains ApellidoMaterno named apellidoMaterno 0..1 MS
* name[NombreOficial].given 1..* MS
* name[NombreOficial].given ^short = "Nombres del Paciente"

* name[NombreSocial] ^short = "Nombre social o recurrente que usa el paciente"
* name[NombreSocial].use 1..1 MS
* name[NombreSocial].use = #usual
* name[NombreSocial].given 1..* MS
* name[NombreSocial].given ^short = "Nombre Social"

* telecom MS
* telecom.system MS
* telecom.value MS
* telecom.use MS

* gender 1..1 MS
* gender ^short = "Sexo administrativo registrado: male | female | other | unknown"
* birthDate 1..1 MS
* birthDate ^short = "Fecha de nacimiento del Paciente (YYYY-MM-DD)"

* address MS

* contact MS
* contact ^short = "Contacto, tutor legal o representante del Paciente (especialmente relevante en pediatría)"
* contact.extension contains IdContacto named IdContacto 0..* MS
* contact.relationship 1..1 MS
* contact.name 1..1 MS
* contact.name.use = #official
* contact.name.family 1..1 MS
* contact.name.given 1..* MS

* communication MS
* communication.language MS
* communication.language from ValueSetIdiomas (required)

* generalPractitioner only Reference(Organization or Practitioner)
* generalPractitioner MS

Mapping: icd-10
Id: icd-10
Title: "ICD-10"
Source: PacienteGenerico
Target: "http://hl7.org/fhir/sid/icd-10"

Mapping: rim
Id: rim
Title: "RIM Mapping"
Source: PatMothersMaidenName
Target: "http://hl7.org/v3"
* -> "Role relationship to entity with maiden name"

Mapping: v2
Id: v2
Title: "HL7 v2 Mapping"
Source: PatMothersMaidenName
Target: "http://hl7.org/v2"
* -> "PID-6"