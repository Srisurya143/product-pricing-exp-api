%dw 2.0
output application/json
---
if  (!isEmpty(error.errorMessage.'payload')) error.errorMessage.'payload'
else
{
	"errorType": error.errorType.namespace as String ++ ":" ++ error.errorType.identifier as String,
	"errorDescription": error.description,
	"detailedDescription": error.detailedDescription
}