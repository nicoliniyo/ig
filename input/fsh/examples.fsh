// ============================================================================
// 1. ORGANIZACIÓN: CENTRO INTEGRAL DE NEURODESARROLLO Y AUTISMO
// ============================================================================
Instance: centro-terapia-autismo
InstanceOf: PerfilOrganizationClinica
Usage: #example
Title: "Ejemplo Organization - Centro Integral de Neurodesarrollo y Autismo"
Description: "Institución prestadora de servicios de salud especializada en evaluación clínica, urgencias pediátricas y terapias de neurodesarrollo (ABA, Logopedia, Son-Rise, Montessori)."
* identifier[0].system = "http://minsalud.gob/registro-prestadores"
* identifier[=].value = "IPS-987654321"
* active = true
* type[0].coding[0].system = $OrgType
* type[=].coding[=].code = #prov
* type[=].coding[=].display = "Healthcare Provider"
* type[=].text = "Centro de Estimulación y Neurodesarrollo"
* name = "Centro Integral de Neurodesarrollo y Autismo"
* telecom[0].system = #phone
* telecom[=].value = "+591 2 2456789"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "contacto@neurodesarrollo.org"
* telecom[=].use = #work
* address[0].use = #work
* address[=].line[0] = "Av. Principal 1234"
* address[=].city = "La Paz"
* address[=].country = "Bolivia"

// ============================================================================
// 2. PACIENTE PEDIÁTRICO (PacienteGenerico)
// ============================================================================
Instance: paciente-pediatrico
InstanceOf: PacienteGenerico
Usage: #example
Title: "Ejemplo Patient - Paciente Pediátrico (Carlos Gómez)"
Description: "Paciente pediátrico con nacionalidad, documento de identidad, apellido materno e idioma español."
* extension[nacionalidad].valueCodeableConcept = CodeSystemPaises#068 "Bolivia (Plurinational State of)"
* identifier[0].use = #official
* identifier[=].type.extension[paises].valueCodeableConcept = CodeSystemPaises#068 "Bolivia (Plurinational State of)"
* identifier[=].type.coding[0].system = $V20203
* identifier[=].type.coding[=].code = #NNBOL
* identifier[=].type.coding[=].display = "Cédula de Identidad Bolivia"
* identifier[=].system = "http://segip.gob.bo/ci"
* identifier[=].value = "12345678"
* name[NombreOficial].use = #official
* name[NombreOficial].family = "Gómez"
* name[NombreOficial].family.extension[apellidoMaterno].valueString = "Pérez"
* name[NombreOficial].given[0] = "Carlos"
* name[NombreSocial].use = #usual
* name[NombreSocial].given[0] = "Carlitos"
* gender = #male
* birthDate = "2020-05-14"
* telecom[0].system = #phone
* telecom[=].value = "+591 70012345"
* telecom[=].use = #mobile
* contact[0].relationship.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0131"
* contact[=].relationship.coding[=].code = #N
* contact[=].relationship.coding[=].display = "Next-of-Kin"
* contact[=].name.use = #official
* contact[=].name.family = "Pérez"
* contact[=].name.given[0] = "María"
* communication[0].language.coding[0].system = $BCP47
* communication[=].language.coding[=].code = #es
* communication[=].language.coding[=].display = "Spanish"
* generalPractitioner[0].reference = "Organization/centro-terapia-autismo"
* generalPractitioner[=].display = "Centro Integral de Neurodesarrollo y Autismo"

// ============================================================================
// 3. DIAGNÓSTICOS CON CODIFICACIÓN DUAL CIE-10 Y CIE-11 (Condition)
// ============================================================================
Instance: diag-tea-cie10-cie11
InstanceOf: PerfilConditionCieDual
Usage: #example
Title: "Ejemplo Condition - Diagnóstico de TEA con CIE-10 (F84.0) y CIE-11 (6A02.2)"
Description: "Diagnóstico principal de Trastorno del Espectro Autista codificado simultáneamente en CIE-10 y CIE-11."
* clinicalStatus.coding[0].system = $CondClinical
* clinicalStatus.coding[=].code = #active
* clinicalStatus.coding[=].display = "Active"
* verificationStatus.coding[0].system = $CondVerStatus
* verificationStatus.coding[=].code = #confirmed
* verificationStatus.coding[=].display = "Confirmed"
* category[0].coding[0].system = $CondCategory
* category[=].coding[=].code = #encounter-diagnosis
* category[=].coding[=].display = "Encounter Diagnosis"
* code.coding[cie10].system = $ICD10
* code.coding[cie10].code = #F84.0
* code.coding[cie10].display = "Autismo en la niñez"
* code.coding[cie11].system = $ICD11
* code.coding[cie11].code = #6A02.2
* code.coding[cie11].display = "Trastorno del espectro autista sin trastorno del desarrollo intelectual y con deterioro del lenguaje funcional"
* code.text = "Trastorno del Espectro Autista (TEA)"
* subject.reference = "Patient/paciente-pediatrico"
* subject.display = "Carlos Gómez"
* encounter.reference = "Encounter/visita-ambulatoria-01"
* recordedDate = "2026-10-21"

Instance: diag-lenguaje-cie10-cie11
InstanceOf: PerfilConditionCieDual
Usage: #example
Title: "Ejemplo Condition - Trastorno del Lenguaje con CIE-10 (F80.9) y CIE-11 (6A01.2)"
Description: "Diagnóstico secundario de trastorno del desarrollo del habla y del lenguaje para justificar sesiones de logopedia."
* clinicalStatus.coding[0].system = $CondClinical
* clinicalStatus.coding[=].code = #active
* clinicalStatus.coding[=].display = "Active"
* verificationStatus.coding[0].system = $CondVerStatus
* verificationStatus.coding[=].code = #confirmed
* verificationStatus.coding[=].display = "Confirmed"
* category[0].coding[0].system = $CondCategory
* category[=].coding[=].code = #encounter-diagnosis
* category[=].coding[=].display = "Encounter Diagnosis"
* code.coding[cie10].system = $ICD10
* code.coding[cie10].code = #F80.9
* code.coding[cie10].display = "Trastorno del desarrollo del habla y del lenguaje no especificado"
* code.coding[cie11].system = $ICD11
* code.coding[cie11].code = #6A01.2
* code.coding[cie11].display = "Trastorno del desarrollo del lenguaje con deterioro del lenguaje expresivo y receptivo"
* code.text = "Trastorno del desarrollo del lenguaje"
* subject.reference = "Patient/paciente-pediatrico"
* subject.display = "Carlos Gómez"
* encounter.reference = "Encounter/visita-ambulatoria-01"
* recordedDate = "2026-10-21"

// ============================================================================
// 4. VISITA MÉDICA AMBULATORIA Y ATENCIÓN DE EMERGENCIA (Encounter)
// ============================================================================
Instance: visita-ambulatoria-01
InstanceOf: PerfilEncounterAtencion
Usage: #example
Title: "Ejemplo Encounter - Consulta Médica Ambulatoria (AMB)"
Description: "Registro de consulta médica ambulatoria de evaluación pediátrica y neurodesarrollo."
* status = #finished
* class = $ActCode#AMB "ambulatory"
* priority.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActPriority"
* priority.coding[=].code = #R
* priority.coding[=].display = "routine"
* subject.reference = "Patient/paciente-pediatrico"
* subject.display = "Carlos Gómez"
* participant[0].individual.display = "Dra. Elena Morales - Neuropediatra"
* period.start = "2026-10-21T09:00:00-04:00"
* period.end = "2026-10-21T09:45:00-04:00"
* diagnosis[0].condition.reference = "Condition/diag-tea-cie10-cie11"
* diagnosis[=].condition.display = "Autismo en la niñez (CIE-10 F84.0 / CIE-11 6A02.2)"
* diagnosis[=].use.coding[0].system = $DiagRole
* diagnosis[=].use.coding[=].code = #AD
* diagnosis[=].use.coding[=].display = "Admission diagnosis"
* diagnosis[=].rank = 1
* diagnosis[+].condition.reference = "Condition/diag-lenguaje-cie10-cie11"
* diagnosis[=].condition.display = "Trastorno del desarrollo del lenguaje (CIE-10 F80.9 / CIE-11 6A01.2)"
* diagnosis[=].rank = 2
* serviceProvider.reference = "Organization/centro-terapia-autismo"
* serviceProvider.display = "Centro Integral de Neurodesarrollo y Autismo"

Instance: visita-emergencia-01
InstanceOf: PerfilEncounterAtencion
Usage: #example
Title: "Ejemplo Encounter - Atención Médica de Emergencia (EMER)"
Description: "Registro de un episodio de atención de urgencia/emergencia pediátrica."
* status = #in-progress
* class = $ActCode#EMER "emergency"
* priority.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-ActPriority"
* priority.coding[=].code = #EM
* priority.coding[=].display = "emergency"
* subject.reference = "Patient/paciente-pediatrico"
* subject.display = "Carlos Gómez"
* participant[0].individual.display = "Dr. Roberto Vargas - Médico de Guardia de Emergencias"
* period.start = "2026-10-21T18:30:00-04:00"
* reasonCode[0].coding[0].system = $ICD10
* reasonCode[=].coding[=].code = #R50.9
* reasonCode[=].coding[=].display = "Fiebre, no especificada"
* reasonCode[=].text = "Fiebre aguda y agitación psicomotriz en servicio de urgencias"
* diagnosis[0].condition.reference = "Condition/diag-tea-cie10-cie11"
* diagnosis[=].condition.display = "Autismo en la niñez (CIE-10 F84.0)"
* diagnosis[=].rank = 1
* serviceProvider.reference = "Organization/centro-terapia-autismo"
* serviceProvider.display = "Centro Integral de Neurodesarrollo y Autismo"

// ============================================================================
// 5. RECETA MÉDICA Y DOSIFICACIÓN (MedicationRequest)
// ============================================================================
Instance: receta-medicamento-01
InstanceOf: PerfilMedicationRequestDosis
Usage: #example
Title: "Ejemplo MedicationRequest - Receta Farmacológica con Dosificación"
Description: "Prescripción médica detallando medicamento, dosis exacta, vía oral, frecuencia cada 8 horas y condición de uso."
* status = #active
* intent = #order
* priority = #routine
* medicationCodeableConcept.coding[0].system = $SCT
* medicationCodeableConcept.coding[=].code = #387517004
* medicationCodeableConcept.coding[=].display = "Paracetamol"
* medicationCodeableConcept.text = "Paracetamol 120 mg / 5 ml Suspensión Oral"
* subject.reference = "Patient/paciente-pediatrico"
* subject.display = "Carlos Gómez"
* encounter.reference = "Encounter/visita-ambulatoria-01"
* authoredOn = "2026-10-21T09:40:00-04:00"
* performer.reference = "Organization/centro-terapia-autismo"
* performer.display = "Farmacia Clínica - Centro Integral de Neurodesarrollo y Autismo"
* reasonReference[0].reference = "Condition/diag-tea-cie10-cie11"
* reasonReference[=].display = "F84.0 Autismo en la niñez"
* dosageInstruction[0].text = "Tomar 5 ml por vía oral cada 8 horas por 7 días (en caso de dolor o fiebre)"
* dosageInstruction[=].timing.repeat.frequency = 1
* dosageInstruction[=].timing.repeat.period = 8
* dosageInstruction[=].timing.repeat.periodUnit = #h
* dosageInstruction[=].timing.repeat.boundsDuration.value = 7
* dosageInstruction[=].timing.repeat.boundsDuration.unit = "días"
* dosageInstruction[=].timing.repeat.boundsDuration.system = $UCUM
* dosageInstruction[=].timing.repeat.boundsDuration.code = #d
* dosageInstruction[=].asNeededBoolean = true
* dosageInstruction[=].route.coding[0].system = $SCT
* dosageInstruction[=].route.coding[=].code = #26643006
* dosageInstruction[=].route.coding[=].display = "Oral route"
* dosageInstruction[=].doseAndRate[0].doseQuantity.value = 5
* dosageInstruction[=].doseAndRate[=].doseQuantity.unit = "ml"
* dosageInstruction[=].doseAndRate[=].doseQuantity.system = $UCUM
* dosageInstruction[=].doseAndRate[=].doseQuantity.code = #mL

// ============================================================================
// 6. PRESCRIPCIÓN DE TERAPIAS NO FARMACOLÓGICAS (ServiceRequest)
// ============================================================================
Instance: orden-terapia-habla
InstanceOf: PerfilServiceRequestTerapias
Usage: #example
Title: "Ejemplo ServiceRequest - Orden de Logopedia / Terapia del Habla"
Description: "Orden médica para sesiones de logopedia/terapia del habla referenciando simultáneamente los diagnósticos de TEA y Trastorno del Lenguaje en CIE-10 y CIE-11."
* status = #active
* intent = #order
* category[0].coding[0].system = $SCT
* category[=].coding[=].code = #409063005
* category[=].coding[=].display = "Counseling/Therapy procedure"
* priority = #routine
* code.coding[0].system = $SCT
* code.coding[=].code = #409063005
* code.coding[=].display = "Speech therapy (logopedia)"
* code.text = "Sesiones de Logopedia / Terapia del habla y lenguaje"
* quantityQuantity.value = 72
* quantityQuantity.unit = "sesiones"
* subject.reference = "Patient/paciente-pediatrico"
* subject.display = "Carlos Gómez"
* encounter.reference = "Encounter/visita-ambulatoria-01"
* occurrenceTiming.repeat.frequency = 3
* occurrenceTiming.repeat.period = 1
* occurrenceTiming.repeat.periodUnit = #wk
* performerType.coding[0].system = $SCT
* performerType.coding[=].code = #159026005
* performerType.coding[=].display = "Speech and language therapist"
* performer[0].reference = "Organization/centro-terapia-autismo"
* performer[=].display = "Centro Integral de Neurodesarrollo y Autismo"
* reasonReference[0].reference = "Condition/diag-tea-cie10-cie11"
* reasonReference[=].display = "TEA (CIE-10 F84.0 / CIE-11 6A02.2)"
* reasonReference[+].reference = "Condition/diag-lenguaje-cie10-cie11"
* reasonReference[=].display = "Trastorno del lenguaje (CIE-10 F80.9 / CIE-11 6A01.2)"

Instance: orden-terapia-aba-montessori
InstanceOf: PerfilServiceRequestTerapias
Usage: #example
Title: "Ejemplo ServiceRequest - Orden de Terapia ABA, Son-Rise y Estimulación Montessori"
Description: "Orden clínica para intervención conductual aplicada (ABA) combinada con estrategias del Programa Son-Rise y estimulación sensorial Montessori."
* status = #active
* intent = #order
* category[0].coding[0].system = $SCT
* category[=].coding[=].code = #409063005
* category[=].coding[=].display = "Counseling/Therapy procedure"
* priority = #routine
* code.coding[0].system = $SCT
* code.coding[=].code = #708035003
* code.coding[=].display = "Applied behavior analysis (ABA)"
* code.coding[+].system = $CodeSystemTerapias
* code.coding[=].code = #son-rise
* code.coding[=].display = "Programa Son-Rise"
* code.coding[+].system = $CodeSystemTerapias
* code.coding[=].code = #estimulacion-montessori
* code.coding[=].display = "Terapia de estimulación sensorio-cognitiva Montessori"
* code.text = "Programa integral de terapia ABA, interacción relacional Son-Rise y estimulación sensorial Montessori"
* quantityQuantity.value = 120
* quantityQuantity.unit = "sesiones"
* subject.reference = "Patient/paciente-pediatrico"
* subject.display = "Carlos Gómez"
* encounter.reference = "Encounter/visita-ambulatoria-01"
* occurrenceTiming.repeat.frequency = 5
* occurrenceTiming.repeat.period = 1
* occurrenceTiming.repeat.periodUnit = #wk
* performerType.coding[0].system = $SCT
* performerType.coding[=].code = #446701002
* performerType.coding[=].display = "Behavior analyst"
* performer[0].reference = "Organization/centro-terapia-autismo"
* performer[=].display = "Centro Integral de Neurodesarrollo y Autismo"
* reasonReference[0].reference = "Condition/diag-tea-cie10-cie11"
* reasonReference[=].display = "TEA (CIE-10 F84.0 / CIE-11 6A02.2)"
