{{- define "container.env" -}}
envFrom:
  - configMapRef:
      name: {{ .Release.Name }}-config
{{- if .Values.envFrom }}
  {{- tpl (toYaml .Values.envFrom) . | nindent 2 }}
{{- end }}
env:
{{- if .Values.extraEnv }}
  {{- tpl (toYaml .Values.extraEnv) . | nindent 2 }}
{{- end }}
{{- if .Values.postgresql.operator.enabled }}
  - name: DATABASE_HOST
    value: {{ template "postgresql.fullname" . }}
  - name: DATABASE_USERNAME
    value: {{ template "postgresql.username" . }}
  - name: DATABASE_PASSWORD
    valueFrom:
      secretKeyRef:
        name: {{ template "postgresql.username" . }}.{{ template "postgresql.fullname" . }}.credentials.postgresql.acid.zalan.do
        key: password
{{- if .Values.kafka.operator.enabled }}
  - name: KAFKA_HOST
    value: {{ template "kafka.service" . }}
{{- end }}
{{- end }}
{{- end }}

