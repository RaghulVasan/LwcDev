public with sharing class DisplayJokes{
    public DisplayJokes ()
    {
    }
    public static String getJoke(){
        Http httpConnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        request.setEndpoint('https://official-joke-api.appspot.com/random_joke');
        request.setMethod('GET');
        //request.setBody(logRecord.Request_Body__c);
        response = httpConnection.send(request);
        System.debug(response.getBody());
        System.debug(response.getStatusCode());
        response = httpConnection.send(request);
        if (response.getStatusCode() == 200) {
            Joke jsonResponse = (Joke) JSON.deserialize(response.getBody(), DisplayJokes.Joke.class);
            System.debug('Joke Type: ' + jsonResponse.type);
            System.debug('Joke Setup: ' + jsonResponse.setup);
            System.debug('Joke Punchline: ' + jsonResponse.punchline);
            return jsonResponse.setup + jsonResponse.punchline;
        } else {
          return null;
        }
    }
    public class Joke{
        public String type {get; set;}
        public String setup  {get; set;}
        public String punchline  {get; set;}
        public Integer id  {get; set;}

    }
}
