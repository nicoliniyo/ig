// ============================================================================
// 1. TERMINOLOGÍA BASE DE HL7 CORE ONLINE (Países, Documentos, Idiomas)
// ============================================================================

CodeSystem: CodeSystemPaises
Id: codesystem-paises
Title: "Códigos de Países"
Description: "Listado de países identificados por código numérico de 3 cifras en español (ISO 3166-1 numérico)."
* ^url = "https://hl7core.online/fhir/CodeSystem/codesystem-paises"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 CORE - FHIR"
* ^copyright = "HL7Core.Online"
* ^caseSensitive = true
* ^content = #complete
* #032 "Argentina"
* #068 "Bolivia (Plurinational State of)"
* #076 "Brazil"
* #152 "Chile"
* #170 "Colombia"
* #188 "Costa Rica"
* #192 "Cuba"
* #218 "Ecuador"
* #222 "El Salvador"
* #320 "Guatemala"
* #340 "Honduras"
* #484 "Mexico"
* #558 "Nicaragua"
* #591 "Panama"
* #600 "Paraguay"
* #604 "Peru"
* #724 "Spain"
* #840 "United States of America"
* #858 "Uruguay"
* #862 "Venezuela (Bolivarian Republic of)"

ValueSet: ValueSetPaises
Id: valueset-paises
Title: "ValueSet de Países ISO 3166-1"
Description: "Conjunto de códigos de países según el CodeSystem de Países de HL7 Core Online."
* ^url = "https://hl7core.online/fhir/ValueSet/valueset-paises"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 CORE - FHIR"
* include codes from system CodeSystemPaises

ValueSet: ValueSetTiposDocumentos
Id: valueSetTiposDocumentos
Title: "Tipos de Documentos"
Description: "Tipos de Documentos para identificación según tabla HL7 V3 / HL7 v2 (0203) y CodeSystem local."
* ^version = "3.0.0-ballot"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 CORE - FHIR"
* ^copyright = "HL7 Core Online"
* include codes from system $V20203

ValueSet: ValueSetIdiomas
Id: idiomas
Title: "ValueSet de Idiomas"
Description: "Conjunto de códigos estándar de idiomas basados en BCP-47 (http://tools.ietf.org/html/bcp47)."
* ^url = "https://hl7core.online/fhir/ValueSet/idiomas"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 CORE - FHIR"
* $BCP47#es "Spanish"
* $BCP47#es-AR "Spanish (Argentina)"
* $BCP47#es-ES "Spanish (Spain)"
* $BCP47#es-UY "Spanish (Uruguay)"
* $BCP47#en "English"
* $BCP47#en-US "English (United States)"
* $BCP47#pt "Portuguese"
* $BCP47#pt-BR "Portuguese (Brazil)"
* $BCP47#fr "French"
* $BCP47#de "German"
* $BCP47#it "Italian"

// ============================================================================
// 2. TERMINOLOGÍA CLÍNICA Y DE NEURODESARROLLO (TEA, Logopedia, ABA, Montessori)
// ============================================================================

CodeSystem: CodeSystemTerapiasDesarrollo
Id: cs-terapias-desarrollo
Title: "CodeSystem de Terapias de Neurodesarrollo y Métodos Pedagógicos"
Description: "Sistema de codificación local para intervenciones terapéuticas y métodos específicos de neurodesarrollo (Son-Rise, Montessori, ABA, Logopedia, etc.)."
* ^url = "https://hl7core.online/fhir/CodeSystem/cs-terapias-desarrollo"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 CORE - FHIR"
* ^caseSensitive = true
* ^content = #complete
* #son-rise "Programa Son-Rise" "Modelo de intervención relacional y de desarrollo centrado en la motivación intrínseca para el Trastorno del Espectro Autista."
* #estimulacion-montessori "Terapia de estimulación sensorio-cognitiva Montessori" "Enfoque pedagógico-terapéutico adaptado con materiales sensoriales estructurados."
* #aba-intensivo "Análisis Conductual Aplicado (ABA) Intensivo" "Intervención conductual estructurada basada en principios de aprendizaje para TEA."
* #logopedia-tea "Logopedia y Terapia del Habla y Lenguaje especializada en TEA" "Intervención fonoaudiológica enfocada en comunicación verbal y alternativa/aumentativa."
* #integracion-sensorial "Terapia de Integración Sensorial" "Terapia ocupacional orientada al procesamiento y modulación sensorial."

ValueSet: ValueSetTerapiasNeurodesarrollo
Id: ValueSetTerapiasNeurodesarrollo
Title: "Terapias de Neurodesarrollo y Comunicación"
Description: "Códigos clínicos de SNOMED CT y CodeSystem local para terapias del habla (logopedia), análisis conductual aplicado (ABA), integración sensorial, Son-Rise y métodos basados en Montessori."
* ^url = "https://hl7core.online/fhir/ValueSet/ValueSetTerapiasNeurodesarrollo"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 CORE - FHIR"
* $SCT#5154007 "Speech therapy"
* $SCT#166001 "Behavioral therapy"
* $SCT#228533008 "Sensory integration technique"
* $SCT#229065009 "Exercise therapy"
* include codes from system CodeSystemTerapiasDesarrollo

ValueSet: VSCIEAutismoYLenguaje
Id: vs-cie-autismo-lenguaje
Title: "Códigos CIE para TEA y Alteraciones del Lenguaje"
Description: "Subconjunto intencional de CIE-10 y CIE-11 para diagnósticos de neurodesarrollo, Trastorno del Espectro Autista (TEA) y trastornos del habla y lenguaje."
* ^url = "https://hl7core.online/fhir/ValueSet/vs-cie-autismo-lenguaje"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 CORE - FHIR"
* $ICD10#F84.0 "Autismo en la niñez"
* $ICD10#F84.1 "Autismo atípico"
* $ICD10#F84.5 "Síndrome de Asperger"
* $ICD10#F80.1 "Trastorno del lenguaje expresivo"
* $ICD10#F80.2 "Trastorno de la recepción del lenguaje"
* $ICD10#F80.9 "Trastorno del desarrollo del habla y del lenguaje no especificado"
* $ICD11#6A02.0 "Trastorno del espectro autista sin trastorno del desarrollo intelectual y con deficiencia leve o nula del lenguaje funcional"
* $ICD11#6A02.2 "Trastorno del espectro autista sin trastorno del desarrollo intelectual y con deterioro del lenguaje funcional"
* $ICD11#6A01.2 "Trastorno del desarrollo del lenguaje con deterioro del lenguaje expresivo y receptivo"

ValueSet: VSEncounterClassAtencion
Id: vs-encounter-class-atencion
Title: "Clases de Encuentro Médico (Ambulatorio y Emergencias)"
Description: "Filtro de v3-ActEncounterCode para clasificar consulta ambulatoria general (AMB) o atención de emergencia (EMER)."
* ^url = "https://hl7core.online/fhir/ValueSet/vs-encounter-class-atencion"
* ^version = "3.0.0-ballot"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 CORE - FHIR"
* $ActCode#AMB "ambulatory"
* $ActCode#EMER "emergency"
