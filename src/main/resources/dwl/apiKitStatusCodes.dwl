%dw 2.0
var errorType = (error.errorType.namespace as String ++ ":" ++ error.errorType.identifier as String)
output application/json
---
if ((errorType) ~= "APIKIT:BAD_REQUEST")
400
else if ((errorType) ~= "APIKIT:NOT_FOUND")
404
else if ((errorType) ~= "APIKIT:METHOD_NOT_ALLOWED")
405
else if ((errorType) ~= "APIKIT:NOT_ACCEPTABLE")
406
else if ((errorType) ~=  "APIKIT:UNSUPPORTED_MEDIA_TYPE")
415
else
500