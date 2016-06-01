curl -XPUT 127.0.0.1:9200/_template/apache_tpl -d '{
        "template" : "apache-*",
        "settings" : {
          "index.refresh_interval" : "5s"
        },
        "mappings" : {
          "apache" : {
             "properties" : {
              "@version" : {
                "index" : "not_analyzed",
                "type" : "string"
              },
              "clientip" : {
                "index": "not_analyzed",
                "type" : "ip"
              },
              "virtualhost" : {
                "index": "not_analyzed",
                "type" : "string"
              },
              "agent" : {
			    "index": "not_analyzed",
                "type" : "string"
              },
              "auth" : {
                "index": "not_analyzed",
                "type" : "string"
              },
              "bytes" : {
				"index": "not_analyzed",
                "type" : "integer"
              },
              "file" : {
                "index": "not_analyzed",
                "type" : "string"
              },
              "host" : {
                "index": "not_analyzed",
                "type" : "string"
              },
              "httpversion" : {
			    "index": "not_analyzed",
                "type" : "string"
              },
              "ident" : {
				"index": "not_analyzed",
                "type" : "string"
              },
              "message" : {
				"index": "not_analyzed",
                "type" : "string"
              },
			  "offset" : {
				"index": "not_analyzed",
                "type" : "string"
              },
			  "referrer" : {
				"index": "not_analyzed",
                "type" : "string"
              },
			  "req_path" : {
				"index": "not_analyzed",
                "type" : "string"
              },
			  "request" : {
				"index": "not_analyzed",
                "type" : "string"
              },
			  "response" : {
				"index": "not_analyzed",
                "type" : "integer"
              },
			  "time_taken" : {
				"index": "not_analyzed",
                "type" : "integer"
              },
			  "verb" : {
				"index": "not_analyzed",
                "type" : "string"
              },
			  "req_query" : {
				"index": "not_analyzed",
                "type" : "string"
              },
			  "ident" : {
				"index": "not_analyzed",
                "type" : "string"
              }
            }
          }
        },
        "aliases" : { }
      }'

