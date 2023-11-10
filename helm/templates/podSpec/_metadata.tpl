{{- define "pod.metadata" -}}
annotations:
  {{- if .Values.podAnnotations -}}
  {{- toYaml .Values.podAnnotations | nindent 2 }}
  {{- end }}
  checksum/deploy: {{ randAlpha 10 | sha256sum }}
labels:
  {{- include "common.labels" . | nindent 2 }}
  {{- if .Values.podLabels }}
  {{- toYaml .Values.podLabels | nindent 2 }}
  {{- end }}
{{- end }}
