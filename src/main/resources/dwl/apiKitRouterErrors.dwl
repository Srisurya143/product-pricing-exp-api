%dw 2.0
output application/json
---
{
	"errorType":  error.errorType.namespace as String ++ ":" ++ error.errorType.identifier as String,
	"errorDescription": error.description,
	"detailedDescription": error.detailedDescription
}
