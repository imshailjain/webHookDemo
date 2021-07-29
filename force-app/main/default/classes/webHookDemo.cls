@RestResource(urlMapping = '/api/webhooks/pushDetailDemo/*')
global with sharing class webHookDemo {
    @HttpPost
    global static void handleNtification() {
        try {
               RestRequest request = RestContext.request;
               RestResponse response = RestContext.response;


        } catch (Exception e) {
            System.debug('Excepton has comes ' + e.getMessage());
        }

    }
}
