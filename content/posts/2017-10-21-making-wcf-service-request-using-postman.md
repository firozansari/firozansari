---
title: "Making WCF service request using Postman"
description: "Here are few steps to use Postman to request WCF services."
date: "2017-10-21 04:03:00"
syndication:
  - "https://twitter.com/firozansari/status/test"
tags:
  - "wcf"
  - "postman"
license_code: "Apache-2.0"
license_prose: "CC-BY-NC-SA-4.0"
slug: "making-wcf-service-request-using-postman"
---
You don't need another WCF client to test WCF services if you already have fantastic Postman installed on your machine. But requesting WCF service using Postman needs little more than just providing a Service Url and a Xml body to the SOAP request. One issue developers always stumble upon first time when using Postman to call a Wcf service is this cryptic error message: `The message with Action '' cannot be processed at the receiver, due to a ContractFilter mismatch at the EndpointDispatcher.`.

Following is an example ActionNotSupported fault response raised by the Wcf Service:

```xml
<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
  <s:Body>
  <s:Fault>
    <faultcode xmlns:a="http://schemas.microsoft.com/ws/2005/05/addressing/none">
      a:ActionNotSupported
    </faultcode>
    <faultstring xml:lang="en-US">
      The message with Action '' cannot be processed at the receiver, due to a ContractFilter mismatch at the
      EndpointDispatcher. This may be because of either a contract mismatch (mismatched Actions between sender and
      receiver) or a binding/security mismatch between the sender and the receiver. Check that sender and receiver
      have the same contract and the same binding (including security requirements, e.g. Message, Transport, None).
    </faultstring>
  </s:Fault>
  </s:Body>
</s:Envelope>
```

![](~/posts/2017/PostmanError.jpg)
<figcaption>ActionNotSupported Soap Fault Code raised by Wcf Service</figcaption>

Inspecting the exception fault string more carefully, you will surely realize that the exception has something to do with Action ''. Postman is apparently not sending any Action contract with the SOAP request, and Wcf service is treating it as empty Action. With the empty received Action, service trying to match it with its own Action contract which result as mismatch. And this is what is causing the exception.

To resolve the issue, you need to explicitly provide a SOAPAction to the header with your SOAP request to the service. You can get the SOAPAction of the web method from the WSDL document of your Wcf service. Just navigate to the WSDL Uri, which usually your Wcf service Url appended with "?wsdl", and look for soap:operation node of the web method you want to call. Copy the value of soapAction attribute which will be something like `http://tempuri.org/I<Your Service Name>/<Method Name>` and use this value as SOAPAction of your service call.

![](~/posts/2017/PostmanWsdl.jpg)
<figcaption>Get the SOAPAction value from WSDL document of your Wcf Service</figcaption>

Adding SOAPAction header in Postman is simple. You have to goto Headers tab of the Postman for the Wcf service, add a New key, provide Key as "SOAPAction" and the Value whatever you copied in above step.

![](~/posts/2017/PostmanSoapAction.jpg)
<figcaption>Configure SOAPAction</figcaption>

With the SOAPAction configured for your Wcf service, hit Send button in Postman to make service call and voila! You should receive proper SOAP response from the service. Save the Service request in the Postman so that you don't have to do the same SOAPAction configuration again for the service.

![](~/posts/2017/PostmanWcfCall.jpg)
<figcaption>Wcf service call using Postman"

My automatized workflow to setup Postman to call Wcf service is following:

1. Make GET call of the service Url with appended "?wsdl".
2. Copy the value of soapAction attribute of your SOAP method.
3. Change Http method to POST and remove "?wsdl"
5. Provide header with key "SOAPAction" and value copied soapAction attribute.
4. Set "Content-Type" header as "text/xml"
6. Provide SOAP Envelop in Body
7. Hit Send (and Save for the future task).