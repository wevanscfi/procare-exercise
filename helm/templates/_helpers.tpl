{{- define "common.formatName" -}}
{{ . | uniq | join "-" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "common.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "common.fullname" -}}
{{- $name := include "common.name" . }}
{{- $parts := concat (splitList "-" .Release.Name) (splitList "-" $name) }}
{{- include "common.formatName" $parts }}
{{- end }}

{{- define "common.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "common.labels" -}}
helm.sh/chart: {{ include "common.chart" . }}
{{ include "common.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "common.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "common.serviceAccountName" -}}
{{ .Release.Name }}
{{- end }}

{{- define "postgresql.fullname" -}}
{{- printf "%s-%s" .Release.Name "postgres" | trunc  63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kafka.fullname" -}}
{{- printf "%s-%s" .Release.Name "kafka" | trunc  63 | trimSuffix "-" -}}
{{- end }}

{{- define "kafka.service" -}}
{{- printf "%s-%s" (include "kafka.fullname" .) "kafka-bootstrap" | trunc  63 | trimSuffix "-" -}}
{{- end }}

{{- define "postgresql.username" -}}
common
{{- end -}}

