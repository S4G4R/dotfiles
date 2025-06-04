{:user {:plugins [[lein-monolith "1.10.0"]
                  [cider/cider-nrepl "0.55.7"]
                  [org.clojars.timvisher/lein-checkout "0.4.2"]]}}
 :bench {:jvm-opts ["-Djdk.attach.allowAttachSelf"]
         :dependencies [[com.clojure-goes-fast/clj-memory-meter "0.3.0"]
                        [criterium "0.4.6"]]}
 ;; lein with-profile +otel repl (api server tracing)
 :otel {:jvm-opts ["-javaagent:opentelemetry-javaagent.jar"
                   "-Dotel.resource.attributes=service.name=api-sagar"
                   "-Dotel.metrics.exporter=none"
                   "-Dotel.logs.exporter=none"
	           ;; For Lightstep developer satellite
                   "-Dotel.exporter.otlp.endpoint=http://localhost:8360"
                   ;; For Jaeger
                   ;; "-Dotel.exporter.otlp.endpoint=http://localhost:4317"
]}}
