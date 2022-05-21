{{/*
Expand the name of the chart.
*/}}
{{- define "pandawa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pandawa.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "pandawa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels for init
*/}}
{{- define "pandawa.init.labels" -}}
helm.sh/chart: {{ include "pandawa.chart" . }}
{{ include "pandawa.init.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for init
*/}}
{{- define "pandawa.init.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pandawa.fullname" . }}-init
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels for api
*/}}
{{- define "pandawa.api.labels" -}}
helm.sh/chart: {{ include "pandawa.chart" . }}
{{ include "pandawa.api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for api
*/}}
{{- define "pandawa.api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pandawa.fullname" . }}-api
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels for worker
*/}}
{{- define "pandawa.worker.labels" -}}
helm.sh/chart: {{ include "pandawa.chart" . }}
{{ include "pandawa.worker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for worker
*/}}
{{- define "pandawa.worker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pandawa.fullname" . }}-worker
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels for scheduler
*/}}
{{- define "pandawa.scheduler.labels" -}}
helm.sh/chart: {{ include "pandawa.chart" . }}
{{ include "pandawa.scheduler.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for scheduler
*/}}
{{- define "pandawa.scheduler.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pandawa.fullname" . }}-scheduler
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels for consumer
*/}}
{{- define "pandawa.consumer.labels" -}}
helm.sh/chart: {{ include "pandawa.chart" . }}
{{ include "pandawa.consumer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for consumer
*/}}
{{- define "pandawa.consumer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pandawa.fullname" . }}-consumer
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "pandawa.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "pandawa.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
