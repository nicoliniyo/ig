{%include styles.html%}

## Recursos FHIR R4 para Clínicas, Emergencias y Terapias de Neurodesarrollo

En FHIR R4, el registro de una consulta clínica general o de emergencia, la prescripción farmacológica con dosificación estructurada y la indicación de terapias de desarrollo o neurorehabilitación (Trastorno del Espectro Autista - TEA, Logopedia/Terapia del habla, Análisis Conductual Aplicado - ABA, Programa Son-Rise y estimulación Montessori) se modelan combinando recursos administrativos, clínicos y de solicitud de servicios.

---

### 1. Registro de la Visita Médica Genérica y Casos de Emergencia

| Recurso | Propósito y Elementos Clave |
| :--- | :--- |
| **`Encounter`** ([`PerfilEncounterAtencion`](StructureDefinition-PerfilEncounterAtencion.html)) | Modela el encuentro o acto médico.<br/>• `status`: `in-progress`, `finished`, etc.<br/>• `class`: define el entorno según [`VSEncounterClassAtencion`](ValueSet-vs-encounter-class-atencion.html). Para consulta ambulatoria general se usa `AMB` (*ambulatory*); para un caso de emergencia se utiliza `EMER` (*emergency*).<br/>• `priority`: evalúa la urgencia (`stat`, `urgent`, `routine`, `EM`).<br/>• `period`: fecha y hora de inicio y fin de la atención.<br/>• `reasonCode` o `reasonReference`: motivo de consulta o urgencia.<br/>• `diagnosis`: diagnósticos vinculados formalmente a la visita.<br/>• `serviceProvider`: referencia al recurso `Organization` responsable. |
| **`Patient`** ([`PacienteGenerico`](StructureDefinition-patientgeneric-id.html)) | El sujeto de atención. Incluye las extensiones de [`nacionalidad`](StructureDefinition-nacionalidad.html), [`tipo-documento`](StructureDefinition-tipo-documento.html), [`ApellidoMaterno`](StructureDefinition-ApellidoMaterno.html) y el binding a [`ValueSet de Idiomas`](ValueSet-idiomas.html). Referenciado en `Encounter.subject`. |
| **`Practitioner` / `PractitionerRole`** | Profesional de la salud que atiende (ej. Neuropediatra, Médico de Guardia, Logopeda, Analista ABA) y su rol funcional en la institución. Referenciado en `Encounter.participant.individual`. |
| **`Condition`** ([`PerfilConditionCieDual`](StructureDefinition-PerfilConditionCieDual.html)) | Diagnósticos identificados, sospechas o hallazgos con codificación dual obligatoria en **CIE-10** y **CIE-11** (ej. `F84.0` / `6A02.2` para Trastorno del Espectro Autista). |
| **`Observation`** | Signos vitales, triage en emergencias, escalas de desarrollo o evaluación clínica. |

---

### 2. Integración del Recurso `Organization` en el Flujo Clínico

El recurso **`Organization`** ([`PerfilOrganizationClinica`](StructureDefinition-PerfilOrganizationClinica.html)) representa a la institución, clínica, centro terapéutico, hospital o departamento que brinda el servicio o gestiona la atención:

- **`identifier`**: Identificadores fiscales, código de prestador de salud nacional (ej. RETHUS, REPS, NPI) o códigos internos.
- **`type`**: Clasificación de la entidad (`prov` para prestador de salud, `dept` para un departamento/servicio específico, `ins` para aseguradoras).
- **`name`**: Nombre legal o comercial (ej. *"Centro Integral de Neurodesarrollo y Autismo"*).
- **`telecom` / `address`**: Datos de contacto y ubicación física.
- **`partOf`**: Permite jerarquías (por ejemplo, el *Servicio de Logopedia/Fonoaudiología* como sub-organización del *Hospital General*).

| Contexto | Recurso Vinculado | Elemento / Atributo | Propósito del Enlace |
| :--- | :--- | :--- | :--- |
| **Visita Médica / Emergencias** | `Encounter` | `Encounter.serviceProvider` | Indica la institución responsable que prestó la atención médica o de urgencias. |
| **Rol del Profesional** | `PractitionerRole` | `PractitionerRole.organization` | Establece la relación contractual/laboral del médico o terapeuta con el hospital o centro clínico. |
| **Receta Farmacológica** | `MedicationRequest` | `MedicationRequest.performer` | Identifica la entidad o farmacia designada para dispensar el medicamento. |
| **Prescripción de Terapias** | `ServiceRequest` | `ServiceRequest.performer` | Asigna la orden de la terapia (ej. ABA, Logopedia, Son-Rise, Montessori) a un centro o clínica especializada. |
| **Plan Integral** | `CarePlan` | `CarePlan.custodian` | Entidad responsable de mantener y supervisar el plan de cuidados multidisciplinario. |

---

### 3. Diagnósticos con Codificación Dual CIE-10 y CIE-11 (`Condition`)

En FHIR R4, el elemento `code` dentro de `Condition` es de tipo `CodeableConcept`, lo que permite incluir múltiples codificaciones (`coding`) en el mismo recurso. El perfil [`PerfilConditionCieDual`](StructureDefinition-PerfilConditionCieDual.html) define un *slicing* sobre `Condition.code.coding` que garantiza la coexistencia de **CIE-10** y **CIE-11** usando el ValueSet [`VSCIEAutismoYLenguaje`](ValueSet-vs-cie-autismo-lenguaje.html):

| Condición Clínica | Sistema CIE-10 (`http://hl7.org/fhir/sid/icd-10`) | Sistema CIE-11 (`http://id.who.int/icd/release/11/mms`) |
| :--- | :--- | :--- |
| **Trastorno del Espectro Autista (sin discapacidad intelectual y con compromiso del lenguaje)** | `F84.0` (*Autismo en la niñez*) | `6A02.2` (*Trastorno del espectro autista sin trastorno del desarrollo intelectual y con deterioro del lenguaje funcional*) |
| **Trastorno del desarrollo del habla o del lenguaje** | `F80.9` (*Trastorno del desarrollo del habla y del lenguaje no especificado*) | `6A01.2` (*Trastorno del desarrollo del lenguaje con deterioro del lenguaje expresivo y receptivo*) |

---

### 4. Recetas de Medicamentos y Dosificación (`MedicationRequest`)

Para prescribir fármacos en consulta general o en urgencias se utiliza **`MedicationRequest`** ([`PerfilMedicationRequestDosis`](StructureDefinition-PerfilMedicationRequestDosis.html)):

- **`status` / `intent`**: Define el estado (`active`, `draft`, etc.) y la intención clínica (`order`, `proposal`).
- **`priority`**: Para prescripciones estándar (`routine`) o en urgencias (`urgent`, `stat`).
- **`medicationCodeableConcept` / `medicationReference`**: Código del medicamento (SNOMED CT, RxNorm) o vínculo al recurso `Medication`.
- **`dosageInstruction`**: Estructura de tipo `Dosage` con:
  - `text`: Instrucción en lenguaje natural (ej. *"Tomar 5 ml por vía oral cada 8 horas por 7 días"*).
  - `timing`: Frecuencia y periodicidad (`Timing.repeat.frequency`, `period`, `periodUnit`, `boundsDuration`).
  - `route`: Vía de administración (`26643006` *Oral route*, intravenosa, etc.).
  - `doseAndRate.doseQuantity`: Cantidad exacta por toma (ej. `5 ml`, `5 mg`).
  - `asNeededBoolean` o `asNeededCodeableConcept`: Si es condicional (ej. *"en caso de dolor o fiebre"*).
- **`encounter`** y **`reasonReference`**: Vínculo con el `Encounter` donde se generó y con el `Condition` que justifica la prescripción.

---

### 5. Prescripción de Terapias no Farmacológicas: Autismo, Logopedia, ABA, Son-Rise y Montessori (`ServiceRequest`)

Las terapias del habla/logopedia, intervención conductual aplicada (ABA), el Programa Son-Rise o los enfoques pedagógicos/terapéuticos adaptados (Montessori) se modelan a través de solicitudes de servicios clínicos mediante **`ServiceRequest`** ([`PerfilServiceRequestTerapias`](StructureDefinition-PerfilServiceRequestTerapias.html)):

- **`category`**: Codificado como `409063005` (*Counseling/Therapy procedure*) o `386053000` (*Evaluation procedure*) en SNOMED CT.
- **`code`**: Procedimiento o terapia solicitada vinculada al ValueSet [`ValueSetTerapiasNeurodesarrollo`](ValueSet-ValueSetTerapiasNeurodesarrollo.html), que integra códigos SNOMED CT (`409063005` *Speech therapy*, `708035003` *Applied behavior analysis*, `385800005` *Sensory integration therapy*) y el CodeSystem local [`CodeSystemTerapiasDesarrollo`](CodeSystem-cs-terapias-desarrollo.html) (`son-rise`, `estimulacion-montessori`, `aba-intensivo`, `logopedia-tea`, `integracion-sensorial`).
- **`quantityQuantity` / `occurrenceTiming`**: Número total de sesiones prescritas y periodicidad (ej. 3 sesiones por semana durante 6 meses: `frequency = 3`, `period = 1`, `periodUnit = #wk`).
- **`performerType` y `performer`**: Rol del profesional requerido (ej. *Speech and language therapist*, *Behavior analyst*, *Occupational therapist*) y referencia al centro terapéutico (`Organization`).
- **`reasonReference`**: Enlace directo a uno o más recursos `Condition` (ej. TEA `diag-tea-cie10-cie11` y Trastorno del lenguaje `diag-lenguaje-cie10-cie11`).
- **Recursos complementarios para seguimiento terapéutico**:
  - `CarePlan`: Estructura el plan integral multidisciplinario a mediano y largo plazo.
  - `Goal`: Metas clínicas o hitos del desarrollo fijados por los terapeutas.
  - `Procedure`: Registra cada sesión terapéutica efectivamente realizada en respuesta al `ServiceRequest`.

---

### 6. Índice de Artefactos y Ejemplos Incluidos

#### Perfiles (`StructureDefinition`)
- [`PacienteGenerico`](StructureDefinition-patientgeneric-id.html): Perfil de Paciente de HL7 Core Online.
- [`PerfilOrganizationClinica`](StructureDefinition-PerfilOrganizationClinica.html): Perfil de Institución Clínica y Centro Terapéutico.
- [`PerfilEncounterAtencion`](StructureDefinition-PerfilEncounterAtencion.html): Perfil de Consulta Ambulatoria (`AMB`) y Emergencias (`EMER`).
- [`PerfilConditionCieDual`](StructureDefinition-PerfilConditionCieDual.html): Perfil de Diagnóstico con Codificación Dual CIE-10 / CIE-11.
- [`PerfilMedicationRequestDosis`](StructureDefinition-PerfilMedicationRequestDosis.html): Perfil de Receta Médica y Dosificación.
- [`PerfilServiceRequestTerapias`](StructureDefinition-PerfilServiceRequestTerapias.html): Perfil de Orden de Terapias de Neurodesarrollo y Lenguaje.

#### Extensiones (`StructureDefinition`)
- [`Nacionalidad`](StructureDefinition-nacionalidad.html) (`https://hl7core.online/fhir/StructureDefinition/nacionalidad`)
- [`TipoDocumento`](StructureDefinition-tipo-documento.html) (`https://hl7core.online/fhir/StructureDefinition/tipo-documento`)
- [`Idioma`](StructureDefinition-idioma.html) (`https://hl7core.online/fhir/StructureDefinition/idioma`)
- [`ApellidoMaterno`](StructureDefinition-ApellidoMaterno.html) (`https://hl7core.online/fhir/StructureDefinition/ApellidoMaterno`)
- [`IdContacto`](StructureDefinition-IdContacto.html) (`https://hl7core.online/fhir/StructureDefinition/IdContacto`)

#### ValueSets y CodeSystems
- [`ValueSetTiposDocumentos`](ValueSet-valueSetTiposDocumentos.html) y [`CodeSystemV20203`](CodeSystem-v2-0203.html)
- [`ValueSetIdiomas`](ValueSet-idiomas.html)
- [`ValueSetPaises`](ValueSet-valueset-paises.html) y [`CodeSystemPaises`](CodeSystem-codesystem-paises.html)
- [`ValueSetTerapiasNeurodesarrollo`](ValueSet-ValueSetTerapiasNeurodesarrollo.html) y [`CodeSystemTerapiasDesarrollo`](CodeSystem-cs-terapias-desarrollo.html)
- [`VSCIEAutismoYLenguaje`](ValueSet-vs-cie-autismo-lenguaje.html)
- [`VSEncounterClassAtencion`](ValueSet-vs-encounter-class-atencion.html)

#### Instancias de Ejemplo
- [`Organization/centro-terapia-autismo`](Organization-centro-terapia-autismo.html): Centro Integral de Neurodesarrollo y Autismo.
- [`Patient/paciente-pediatrico`](Patient-paciente-pediatrico.html): Paciente pediátrico Carlos Gómez Pérez.
- [`Condition/diag-tea-cie10-cie11`](Condition-diag-tea-cie10-cie11.html): Diagnóstico de TEA (`F84.0` / `6A02.2`).
- [`Condition/diag-lenguaje-cie10-cie11`](Condition-diag-lenguaje-cie10-cie11.html): Diagnóstico de Trastorno del Lenguaje (`F80.9` / `6A01.2`).
- [`Encounter/visita-ambulatoria-01`](Encounter-visita-ambulatoria-01.html): Consulta ambulatoria de neuropediatría (`AMB`).
- [`Encounter/visita-emergencia-01`](Encounter-visita-emergencia-01.html): Atención pediátrica de urgencias (`EMER`).
- [`MedicationRequest/receta-medicamento-01`](MedicationRequest-receta-medicamento-01.html): Prescripción de Paracetamol con dosificación estructurada.
- [`ServiceRequest/orden-terapia-habla`](ServiceRequest-orden-terapia-habla.html): Orden de sesiones de Logopedia / Terapia del habla.
- [`ServiceRequest/orden-terapia-aba-montessori`](ServiceRequest-orden-terapia-aba-montessori.html): Orden de terapia ABA, Programa Son-Rise y estimulación Montessori.
