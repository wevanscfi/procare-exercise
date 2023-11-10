{{- define "pod.spec" -}}
serviceAccountName: {{ include "common.serviceAccountName" . }}
{{- if .Values.terminationGracePeriodSeconds }}
terminationGracePeriodSeconds: {{ .Values.terminationGracePeriodSeconds }}
{{- end }}
{{- if .Values.restartPolicy }}
restartPolicy: {{ .Values.restartPolicy }}
{{- end }}
{{- include "pod.affinities" . }}
{{- if .Values.volumes }}
volumes:
{{- toYaml .Values.volumes | nindent 2 }}
{{- end }}
{{- end }}
