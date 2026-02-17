%dw 2.0
output application/json skipNullOn='everywhere'
---
{
	"flowName": vars.loggingVars.flowName,
	"apiName": vars.loggingVars.appName,
	"appVersion": vars.loggingVars.appVersion,
	"timeStamp": now(),
	"correlationId": vars.loggingVars.correlationId,
	"processStartTime": vars.apiKickOffTime	as String ++ "ms",
	"rsourcePath": vars.resourcePath,
	"step": Mule::p('step.processStart')
}