{{- define "container.probes" -}}
{{- if .Values.readinessProbe -}}
readinessProbe:
  {{- toYaml .Values.readinessProbe | nindent 2 }}
{{- end -}}
{{- if .Values.livenessProbe }}
livenessProbe:
  {{- toYaml .Values.livenessProbe | nindent 2 }}
{{- end }}
{{- if .Values.startupProbe }}
startupProbe:
  {{- toYaml .Values.startupProbe | nindent 2 }}
{{- end }}
{{- end }}

