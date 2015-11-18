Feature: Create a Push Manger Object
   Scenario: Create an object for Apple's Server
   Given:  The User provides the \"apple\" parameter
   Then: They should recieve an APNS object.

   Scenario: Create an object for Google's Server
   Given:  The User provides the \"google\" parameter
   Then: They should recieve an GCM object.
