// ============================================================================
// A. PERFIL PARA ORGANIZACIÓN CLÍNICA / CENTRO TERAPÉUTICO (Organization)
// ============================================================================
Profile: PerfilOrganizationClinica
Parent: Organization
Id: PerfilOrganizationClinica
Title: "Perfil Organization - Institución Clínica y Centro Terapéutico"
Description: "Perfil para representar hospitales, clínicas de urgencias, farmacias y centros especializados de neurodesarrollo y terapias (ABA, Logopedia, Son-Rise, Montessori)."
* ^url = "https://hl7core.online/fhir/StructureDefinition/PerfilOrganizationClinica"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 CORE - FHIR"
* extension contains Idioma named idioma 0..1 MS
* extension[idioma] ^short = "Idioma principal / primera lengua de atención de la institución"
* identifier 1..* MS
* identifier ^short = "Identificadores fiscales o código nacional de prestador de salud (ej. REPS, RETHUS, NPI)"
* active 1..1 MS
* type 1..* MS
* type ^short = "Clasificación de la entidad (ej. prov para prestador de salud, dept para servicio específico)"
* name 1..1 MS
* name ^short = "Nombre legal o comercial del establecimiento o centro terapéutico"
* telecom 0..* MS
* address 0..* MS
* partOf 0..1 MS
* partOf only Reference(Organization)
* partOf ^short = "Organización matriz (ej. Servicio de Logopedia como parte del Hospital General)"

// ============================================================================
// B. PERFIL PARA VISITA MÉDICA GENÉRICA Y CASOS DE EMERGENCIA (Encounter)
// ============================================================================
Profile: PerfilEncounterAtencion
Parent: Encounter
Id: PerfilEncounterAtencion
Title: "Perfil Encounter - Atención Ambulatoria y Emergencias"
Description: "Modela tanto la consulta médica ambulatoria general (AMB) como la atención en casos de emergencia (EMER), vinculando paciente, profesional, institución y diagnósticos."
* ^url = "https://hl7core.online/fhir/StructureDefinition/PerfilEncounterAtencion"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 CORE - FHIR"
* status 1..1 MS
* status ^short = "Estado del encuentro: planned | arrived | triaged | in-progress | finished | cancelled"
* class 1..1 MS
* class from VSEncounterClassAtencion (extensible)
* class ^short = "Entorno de atención: AMB (consulta ambulatoria) o EMER (emergencia)"
* priority 0..1 MS
* priority ^short = "Urgencia del acto médico (ej. stat, urgent, routine)"
* subject 1..1 MS
* subject only Reference(PacienteGenerico or Patient)
* subject ^short = "Paciente sujeto de la atención médica o de emergencia"
* participant 1..* MS
* participant.individual 1..1 MS
* participant.individual only Reference(Practitioner or PractitionerRole)
* participant.individual ^short = "Profesional de la salud que atiende la consulta o urgencia"
* period 1..1 MS
* period.start 1..1 MS
* period ^short = "Fecha y hora de inicio (y fin) de la atención"
* reasonCode 0..* MS
* reasonCode ^short = "Motivo de consulta o emergencia codificado (ej. CIE-10 / SNOMED CT)"
* reasonReference 0..* MS
* reasonReference only Reference(Condition or Observation or Procedure)
* diagnosis 0..* MS
* diagnosis.condition 1..1 MS
* diagnosis.condition only Reference(PerfilConditionCieDual or Condition)
* diagnosis.use 0..1 MS
* diagnosis.rank 0..1 MS
* serviceProvider 1..1 MS
* serviceProvider only Reference(PerfilOrganizationClinica or Organization)
* serviceProvider ^short = "Institución clínica o centro responsable de la atención"

// ============================================================================
// C. PERFIL PARA DIAGNÓSTICOS CON CODIFICACIÓN DUAL CIE-10 / CIE-11 (Condition)
// ============================================================================
Profile: PerfilConditionCieDual
Parent: Condition
Id: PerfilConditionCieDual
Title: "Perfil Condition - Diagnóstico con Codificación Dual CIE-10 / CIE-11"
Description: "Perfil para el registro de diagnósticos clínicos y de neurodesarrollo que exige la coexistencia de códigos CIE-10 y CIE-11 en el mismo recurso Condition."
* ^url = "https://hl7core.online/fhir/StructureDefinition/PerfilConditionCieDual"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 CORE - FHIR"
* clinicalStatus 1..1 MS
* verificationStatus 1..1 MS
* category 1..* MS
* subject 1..1 MS
* subject only Reference(PacienteGenerico or Patient)
* encounter 1..1 MS
* encounter only Reference(PerfilEncounterAtencion or Encounter)
* recordedDate 0..1 MS

// Slicing para exigir simultáneamente CIE-10 y CIE-11
* code 1..1 MS
* code from VSCIEAutismoYLenguaje (extensible)
* code.coding 2..* MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "Codificación dual obligatoria en CIE-10 y CIE-11"
* code.coding contains
    cie10 1..1 MS and
    cie11 1..1 MS
* code.coding[cie10].system 1..1 MS
* code.coding[cie10].system = "http://hl7.org/fhir/sid/icd-10" (exactly)
* code.coding[cie10].code 1..1 MS
* code.coding[cie10].display 0..1 MS
* code.coding[cie11].system 1..1 MS
* code.coding[cie11].system = "http://id.who.int/icd/release/11/mms" (exactly)
* code.coding[cie11].code 1..1 MS
* code.coding[cie11].display 0..1 MS

// ============================================================================
// D. PERFIL PARA RECETAS DE MEDICAMENTOS Y DOSIFICACIÓN (MedicationRequest)
// ============================================================================
Profile: PerfilMedicationRequestDosis
Parent: MedicationRequest
Id: PerfilMedicationRequestDosis
Title: "Perfil MedicationRequest - Prescripción Médica y Dosificación"
Description: "Perfil para registrar recetas farmacológicas estándar o de emergencia, detallando la estructura de dosificación (frecuencia, vía, dosis exacta y condición de uso)."
* ^url = "https://hl7core.online/fhir/StructureDefinition/PerfilMedicationRequestDosis"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 CORE - FHIR"
* status 1..1 MS
* status ^short = "Estado de la receta (active, draft, completed, cancelled)"
* intent 1..1 MS
* intent ^short = "Intención clínica (order, proposal, plan)"
* priority 0..1 MS
* priority ^short = "Prioridad de prescripción: routine | urgent | asap | stat"
* medication[x] 1..1 MS
* medication[x] ^short = "Medicamento prescrito (Código SNOMED CT / RxNorm o referencia a Medication)"
* subject 1..1 MS
* subject only Reference(PacienteGenerico or Patient)
* encounter 1..1 MS
* encounter only Reference(PerfilEncounterAtencion or Encounter)
* authoredOn 0..1 MS
* requester 0..1 MS
* requester only Reference(Practitioner or PractitionerRole or Organization)
* performer 0..1 MS
* performer only Reference(PerfilOrganizationClinica or Organization or Practitioner or PractitionerRole)
* performer ^short = "Entidad o farmacia designada para dispensar o administrar el medicamento"
* reasonReference 0..* MS
* reasonReference only Reference(PerfilConditionCieDual or Condition or Observation)
* reasonReference ^short = "Diagnóstico que justifica el tratamiento farmacológico"
* dosageInstruction 1..* MS
* dosageInstruction.text 1..1 MS
* dosageInstruction.text ^short = "Instrucción posológica en lenguaje natural (ej. 'Tomar 5 ml cada 8 horas por 7 días')"
* dosageInstruction.timing 0..1 MS
* dosageInstruction.timing ^short = "Frecuencia y periodicidad estructurada (Timing.repeat)"
* dosageInstruction.asNeeded[x] 0..1 MS
* dosageInstruction.asNeeded[x] ^short = "Indicación condicional (ej. en caso de dolor, fiebre o crisis)"
* dosageInstruction.route 0..1 MS
* dosageInstruction.route ^short = "Vía de administración (oral, intravenosa, intramuscular, etc.)"
* dosageInstruction.doseAndRate 1..* MS
* dosageInstruction.doseAndRate.dose[x] 1..1 MS
* dosageInstruction.doseAndRate.dose[x] only SimpleQuantity or Range
* dosageInstruction.doseAndRate.dose[x] ^short = "Cantidad exacta por toma (ej. 5 mg, 10 ml)"

// ============================================================================
// E. PERFIL PARA ORDEN DE TERAPIAS NO FARMACOLÓGICAS (ServiceRequest)
// ============================================================================
Profile: PerfilServiceRequestTerapias
Parent: ServiceRequest
Id: PerfilServiceRequestTerapias
Title: "Perfil ServiceRequest - Solicitud de Terapias de Neurodesarrollo y Lenguaje"
Description: "Perfil para prescribir sesiones terapéuticas especializadas no farmacológicas en autismo y desarrollo: Logopedia/Terapia del habla, Análisis Conductual Aplicado (ABA), Programa Son-Rise y estimulación Montessori."
* ^url = "https://hl7core.online/fhir/StructureDefinition/PerfilServiceRequestTerapias"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 CORE - FHIR"
* status 1..1 MS
* status = #active
* intent 1..1 MS
* intent = #order
* category 0..* MS
* category ^short = "Categoría del servicio (ej. 409063005 Counseling/Therapy procedure o 386053000 Evaluation procedure)"
* priority 0..1 MS
* code 1..1 MS
* code from ValueSetTerapiasNeurodesarrollo (extensible)
* code ^short = "Terapia indicada: Logopedia, ABA, Integración Sensorial, Son-Rise o Montessori"
* quantity[x] 0..1 MS
* quantity[x] only Quantity
* quantity[x] ^short = "Número total de sesiones prescritas"
* subject 1..1 MS
* subject only Reference(PacienteGenerico or Patient)
* encounter 1..1 MS
* encounter only Reference(PerfilEncounterAtencion or Encounter)
* occurrence[x] 1..1 MS
* occurrence[x] only Timing
* occurrenceTiming 1..1 MS
* occurrenceTiming.repeat 1..1 MS
* occurrenceTiming.repeat.frequency 1..1 MS
* occurrenceTiming.repeat.period 1..1 MS
* occurrenceTiming.repeat.periodUnit 1..1 MS
* occurrenceTiming ^short = "Periodicidad de las sesiones (ej. 3 sesiones por semana durante 6 meses)"
* requester 0..1 MS
* requester only Reference(Practitioner or PractitionerRole or Organization)
* performerType 0..1 MS
* performerType ^short = "Rol del terapeuta requerido (ej. Fonoaudiólogo/Logopeda, Analista Conductual ABA, Terapeuta Ocupacional)"
* performer 0..* MS
* performer only Reference(PerfilOrganizationClinica or Organization or PractitionerRole or Practitioner)
* performer ^short = "Centro terapéutico o especialista asignado para ejecutar la terapia"
* reasonReference 1..* MS
* reasonReference only Reference(PerfilConditionCieDual or Condition)
* reasonReference ^short = "Vinculación obligatoria al diagnóstico CIE-10 / CIE-11 que justifica la terapia"

// ============================================================================
// F. PERFIL CONSOLIDADOR DE REGISTRO INTEGRAL (Bundle Transaction)
// ============================================================================
Profile: PerfilBundleRegistroIntegral
Parent: Bundle
Id: PerfilBundleRegistroIntegral
Title: "Perfil Bundle - Registro Integral de Atención Clínica y Neurodesarrollo"
Description: "Perfil consolidador de tipo Bundle (transaction) que agrupa y registra en una sola estructura la institución clínica (Organization), el paciente (Patient), las visitas médicas y de emergencia (Encounter), los diagnósticos con codificación dual CIE-10/CIE-11 (Condition), las prescripciones farmacológicas (MedicationRequest) y las órdenes de terapias de neurodesarrollo (ServiceRequest)."
* ^url = "https://hl7core.online/fhir/StructureDefinition/PerfilBundleRegistroIntegral"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^publisher = "HL7 CORE - FHIR"
* identifier 0..1 MS
* identifier ^short = "Identificador único del paquete o transacción clínica"
* type 1..1 MS
* type = #transaction (exactly)
* type ^short = "Bundle transaccional para registro simultáneo de todos los recursos clínicos y administrativos"
* timestamp 0..1 MS
* timestamp ^short = "Fecha y hora de generación del paquete de registro integral"
* entry 1..* MS
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing de entradas según cada perfil clínico y administrativo de la Guía de Implementación"
* entry.fullUrl 1..1 MS
* entry.resource 1..1 MS
* entry.request 1..1 MS
* entry.request.method 1..1 MS
* entry.request.url 1..1 MS
* entry contains
    organizacion 1..* MS and
    paciente 1..1 MS and
    encuentro 1..* MS and
    diagnostico 1..* MS and
    recetaMedicamento 0..* MS and
    ordenTerapia 0..* MS

* entry[organizacion] ^short = "Registro de la institución clínica o centro terapéutico (PerfilOrganizationClinica)"
* entry[organizacion].resource 1..1 MS
* entry[organizacion].resource only PerfilOrganizationClinica
* entry[organizacion].request 1..1 MS

* entry[paciente] ^short = "Registro del paciente sujeto de atención (PacienteGenerico)"
* entry[paciente].resource 1..1 MS
* entry[paciente].resource only PacienteGenerico
* entry[paciente].request 1..1 MS

* entry[encuentro] ^short = "Registro de visitas médicas ambulatorias (AMB) y de emergencia (EMER) (PerfilEncounterAtencion)"
* entry[encuentro].resource 1..1 MS
* entry[encuentro].resource only PerfilEncounterAtencion
* entry[encuentro].request 1..1 MS

* entry[diagnostico] ^short = "Registro de diagnósticos con codificación dual CIE-10 / CIE-11 (PerfilConditionCieDual)"
* entry[diagnostico].resource 1..1 MS
* entry[diagnostico].resource only PerfilConditionCieDual
* entry[diagnostico].request 1..1 MS

* entry[recetaMedicamento] ^short = "Registro de prescripciones farmacológicas y dosificación (PerfilMedicationRequestDosis)"
* entry[recetaMedicamento].resource 1..1 MS
* entry[recetaMedicamento].resource only PerfilMedicationRequestDosis
* entry[recetaMedicamento].request 1..1 MS

* entry[ordenTerapia] ^short = "Registro de órdenes de terapias de neurodesarrollo y lenguaje (PerfilServiceRequestTerapias)"
* entry[ordenTerapia].resource 1..1 MS
* entry[ordenTerapia].resource only PerfilServiceRequestTerapias
* entry[ordenTerapia].request 1..1 MS

