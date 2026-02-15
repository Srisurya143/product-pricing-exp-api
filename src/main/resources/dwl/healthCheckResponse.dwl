%dw 2.0
var healthCheckPayload = (((payload mapObject ((value, key, index) -> "key": value)).*key).payload)
var systems = flatten(healthCheckPayload.response.systems)
var apis = healthCheckPayload map {
    "code": if (!isEmpty($.response.message)) $.response.code else "OK",
    "message": if (!isEmpty($.response.message)) $.response.message else $.response.application ++ " is reachable",
    "name": $.response.application
}
output application/json
---
{
    "message": "OK",
    "reason": "health check",
    "response": {
        "application": p('api.Name'),
        "buildVersion": p('api.Version'),
        "buildTimeStamp": now(),
        "code": if (healthCheckPayload.response.code contains "ERROR") "ERROR" else "OK",
        "failed": if (healthCheckPayload.response.code contains "ERROR") true else false,
        "host": vars.host,
        "tier": p('mule.env') default "",
        "systems":
            if (!isEmpty(systems))
                ((apis default [] ++ systems default []) distinctBy $.name)
            else
                ((apis default [] ++ systems default []) distinctBy $.name)
    },
    "status": 200
}
