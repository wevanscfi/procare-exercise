{{- define "container.spec" -}}
- name: {{ include "common.name" . }}
  image: {{ .Values.image.name }}:{{ .Values.image.tag }}
  imagePullPolicy: {{ (.Values.image).pullPolicy | default "IfNotPresent" }}
  {{- if .Values.command }}
  command:
    {{- toYaml .Values.command | nindent 4 }}
  {{- if .Values.args }}
  args:
    {{- toYaml .Values.args | nindent 4 }}
  {{- end }}
  {{- end }}
  {{- include "container.env" . | nindent 2 }}
  {{- include "container.probes" . | nindent 2 }}
  {{- if .Values.resources }}
  resources:
  {{- toYaml .Values.resources | nindent 4 }}
  {{- end }}
  {{- if .Values.ports }}
  ports:
  {{- range .Values.ports }}
    - name: {{ .name }}
      containerPort: {{ .containerPort }}
  {{- end }}
  {{- end }}
  {{- if .Values.lifecycle }}
  lifecycle:
  {{- toYaml .Values.lifecycle | nindent 4 }}
  {{- end }}
  {{- if .Values.volumeMounts }}
  volumeMounts:
  {{- toYaml .Values.values.volumeMounts | nindent 4 }}
  {{- end }}
{{- end -}}

