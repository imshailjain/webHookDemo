@RestResource(urlMapping = '/api/webhooks/pushDetailDemo/*')
global with sharing class webHookDemo {
    @HttpPost
    global static void handleNtification() {
        try {
               RestRequest request = RestContext.request;
               RestResponse response = RestContext.response;

               JSONParser parser = JSON.createParser(request.requestBody.toString());
               pusher ps;
              
               string repo;
               while (parser.nextToken() != null) {
                    if (parser.getText() == 'pusher') {
                        parser.nextToken();
                        ps=(pusher)parser.readValueAs(pusher.class);                       
                    }
                  
                   if (parser.getText() == 'full_name') {
                        parser.nextToken();
                        repo=parser.getText();                       
                     }

                    GitHubPushDetail__c detail = new GitHubPushDetail__c();
                    detail.CommitterName__c = ps!=null?ps.name:'';
                   // detail.CommitterEmail__c =ps!=null?ps.email:'';
                    
                    insert detail;
                   
               }

        } catch (Exception e) {
            System.debug('Excepton has comes ' + e.getMessage());
        }

    }

    public class pusher {
        public String name;
        public String email;

        public pusher(String name, String email){
            name = name;
            email = email;
        }
    }


}
