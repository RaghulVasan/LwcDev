public static void CreateOpportunity()
        {
                Http HttpConn= new Http();
                HttpRequest request=new HttpRequest();
                HttpResponse response = new HttpResponse();
                String baseEndPoint=getAccessToken().instance_url;
                String endPoint=baseEndPoint+'/services/data/v58.0/sobjects/opportunity/';
                String bearer='Bearer '+getAccessToken().access_token;
                request.setEndpoint(endPoint);
                request.setMethod('POST');
                request.setHeader('Authorization', bearer);
                request.setHeader('Content-Type', 'application/json');
                AccountCreation insertNewRecord = new AccountCreation();
                insertNewRecord.Name='Opportunity';
                String jsonBody =JSON.serialize(insertNewRecord);
                request.setBody(jsonBody);
                response=HttpConn.send(request);
                if (response.getStatusCode()==200 || response.getStatusCode()==201)
                {
                        System.debug(response.getBody());
                }
        }


        public class WrapperClassForAccessToken
        {
                public String access_token{get; set;}
                public String instance_url{get; set;}
                public String id{get; set;}
                public String token_type{get; set;}
                public String issued_at{get; set;}
                public String signature{get; set;}

        }

        public class opportunityCreation
        {
            public String Name{get; set;}

        }