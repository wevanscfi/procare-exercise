{{- define "pod.affinities" -}}
{{- if .Values.nodeSelector }}
nodeSelector:
  {{- toYaml .Values.nodeSelector | nindent 2 }}
{{- end }}
{{- if .Values.tolerations }}
tolerations:
  {{- toYaml .Values.tolerations | nindent 2 }}
{{- end }}
{{- if .Values.affinity }}
affinity:
  {{- toYaml .Values.affinity | nindent 2 }}
{{- end }}
{{- end }}

