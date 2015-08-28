Hostname "{{ HOST_NAME | default("webserver-docker") }}"

FQDNLookup false
Interval 10
Timeout 2
ReadThreads 5

LoadPlugin cpu
LoadPlugin disk
LoadPlugin interface
LoadPlugin load
LoadPlugin memory
LoadPlugin cpu
LoadPlugin write_http

<Plugin write_http>
    <URL "{{ COLLECTD_WRITEHTTP_HOST }}">
        Format "JSON"
        StoreRates false
    </URL>
</Plugin>
