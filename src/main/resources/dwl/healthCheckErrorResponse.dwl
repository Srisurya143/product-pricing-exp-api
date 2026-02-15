%dw 2.0
output application/json
---
{
    application: "product pricing prc api health check for env " ++ p('mule.env'),
    message: "product pricing prc api is not reachable",
    error: (error.detailedDescription default "Unknown error"),
    code: "ERROR"
}
