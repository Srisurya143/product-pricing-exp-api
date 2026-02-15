%dw 2.0
output application/json
---
{
	"appName": Mule::p('api.Name'),
	"appVersion": Mule::p('api.Version'),
	"timeStamp": now(),
	"correlationId": attributes.headers.correlationId default correlationId,
	"flowName": "product-pricing-exp-api-main"	
}