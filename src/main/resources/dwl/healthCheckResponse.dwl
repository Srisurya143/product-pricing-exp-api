%dw 2.0
output application/json
---
{
    "message": "OK",
    "reason": "health check",
    "response": {
        "application": p('api.Name'),
        "buildVersion": p('api.Version'),
        "buildTimeStamp": now(),
        "code": if (payload.response.systems.code contains "ERROR") "ERROR" else "OK",
        "failed": if (payload.response.systems.code contains "ERROR") true else false,
        "host": vars.host default attributes.headers.host,
        "tier": p('mule.env'),
        "systems": [
            {
                "code": if (payload.response.systems.code contains "ERROR") "ERROR" else "OK",
                "message": if (payload.response.systems.code contains "ERROR") 
                              "product-pricing-prc-api is not reachable" 
                           else 
                              "product-pricing-prc-api is reachable",
                "name": "product-pricing-prc-api"
            }
        ] ++ (payload.response.systems default [])
    },
    "status": 200
}
