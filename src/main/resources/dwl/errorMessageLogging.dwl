%dw 2.0
import * from dw::util::Timer
output application/json
---
{
	"flowName": vars.loggingVars.flowName default "",
	"apiName": vars.loggingVars.apiName default Mule::p('api.Name'),
	"eventTimeStamp": now(),
	"appId": "",
	"correlationId": vars.loggingVars.correlationId default correlationId,
	"transactionLevel": Mule::p('errorLogger.transactionlevel'),
	"status": p('errorLogger.status'),
	"code": if(!isEmpty(attributes.statusCode)) attributes.statusCode else "NA",
	"errorType": error.errorType,
	"description": if(!isEmpty(error.errorMessage)) error.errorMessage.payload else if(!isEmpty(error.description)) error.description else "",	
	"detailedDescription": if(!isEmpty(error.errorMessage)) error.errorMessage.payload else if(!isEmpty(error.detailedDescription)) error.detailedDescription else "" 
	}