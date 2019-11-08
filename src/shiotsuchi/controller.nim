import json
import jester
import BaseClass
export
  jester,
  BaseClass


# String
proc render*(body:string):Response =
  return Response(status:Http200, bodyString:body, responseType:String)

proc render*(status:HttpCode, body:string):Response =
  return Response(status:status, bodyString:body, responseType:String)


# Json
proc render*(body:JsonNode):Response =
  return Response(status:Http200, bodyJson:body, responseType:Json)

proc render*(status:HttpCode, body:JsonNode):Response =
  return Response(status:status, bodyJson:body, responseType:Json)


# with header
proc header*(r:Response, key:string, value:string):Response =
  var response = r
  response.headers.add(
    (key, value)
  )
  return response

proc header*(r:Response, key:string, valuesArg:openArray[string]):Response =
  var response = r
  
  var value = ""
  for i, v in valuesArg:
    if i > 0:
      value.add(", ")
    value.add(v)

  response.headers.add((key, value))
  return response