Extension: Nacionalidad
Id: nacionalidad
Title: "Nacionalidad basado en Países"
Description: "Extensión para asignar el país o nacionalidad del sujeto según el listado ISO 3166-1 numérico."
* ^url = "https://hl7core.online/fhir/StructureDefinition/nacionalidad"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 CORE - FHIR"
* ^context[0].type = #element
* ^context[=].expression = "Patient"
* ^context[+].type = #element
* ^context[=].expression = "Practitioner"
* ^context[+].type = #element
* ^context[=].expression = "Identifier.type"
* value[x] only CodeableConcept
* valueCodeableConcept from ValueSetPaises (required)
* valueCodeableConcept ^short = "Código de país (ISO 3166-1 numérico)"

Extension: TipoDocumento
Id: tipo-documento
Title: "Tipo de Documento de Identidad"
Description: "Extensión para tipificar documentos de identidad en recursos como Patient o Practitioner."
* ^url = "https://hl7core.online/fhir/StructureDefinition/tipo-documento"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 CORE - FHIR"
* ^context[0].type = #element
* ^context[=].expression = "Patient.identifier"
* ^context[+].type = #element
* ^context[=].expression = "Practitioner.identifier"
* value[x] only CodeableConcept
* valueCodeableConcept from ValueSetTiposDocumentos (required)
* valueCodeableConcept ^short = "Tipo de documento según ValueSetTiposDocumentos"

Extension: Idioma
Id: idioma
Title: "Idioma"
Description: "Especifica el idioma principal (primera lengua) o preferencias de comunicación basados en BCP-47, para recursos que no disponen del elemento nativo communication (ej. Organization)."
* ^url = "https://hl7core.online/fhir/StructureDefinition/idioma"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 CORE - FHIR"
* ^context[0].type = #element
* ^context[=].expression = "Patient"
* ^context[+].type = #element
* ^context[=].expression = "Practitioner"
* ^context[+].type = #element
* ^context[=].expression = "Organization"
* value[x] only CodeableConcept
* valueCodeableConcept from ValueSetIdiomas (required)
* valueCodeableConcept ^short = "Código de idioma principal / primera lengua (BCP-47)"

Extension: ApellidoMaterno
Id: ApellidoMaterno
Title: "Apellido Materno"
Description: "Extensión para la declaración del segundo apellido o apellido materno."
* ^url = "https://hl7core.online/fhir/StructureDefinition/ApellidoMaterno"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 CORE - FHIR"
* ^context[0].type = #element
* ^context[=].expression = "HumanName.family"
* value[x] 1..1
* value[x] only string
* valueString ^short = "Segundo apellido / Apellido materno"

Extension: IdContacto
Id: IdContacto
Title: "Identificación del Contacto"
Description: "Extensión para declarar la identificación del contacto o representante legal del paciente."
* ^url = "https://hl7core.online/fhir/StructureDefinition/IdContacto"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 CORE - FHIR"
* ^context[0].type = #element
* ^context[=].expression = "Patient.contact"
* value[x] 1..1
* value[x] only Identifier
* valueIdentifier ^short = "Identificador oficial del contacto o tutor"

Extension: PatMothersMaidenName
Id: patient-mothersMaidenName
Title: "Patient Mother's Maiden Name"
Description: "Mother's maiden (unmarried) name, commonly collected to help verify patient identity."
* ^url = "https://hl7core.online/fhir/StructureDefinition/patient-mothersMaidenName"
* ^version = "3.0.0-ballot"
* ^experimental = false
* ^publisher = "HL7 CORE - FHIR"
* ^jurisdiction = $m49.htm#001
* ^context.type = #element
* ^context.expression = "Patient"
* . ..1
* . ^short = "Mother's Maiden name"
* . ^definition = "Mother's maiden (unmarried) name, commonly collected to help verify patient identity."
* value[x] 1..1
* value[x] only string
