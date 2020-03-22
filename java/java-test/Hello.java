import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class RequestTest {
    public static void main(String[] args) {
        makeRequest("https://aqua-m.tk/price-list");
    }

    private static void makeRequest(String url) {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder().uri(URI.create(url)).build();

        client.sendAsync(request, HttpResponse.BodyHandlers.ofString())
            .thenApply(HttpResponse::body)
            .thenAccept(RequestTest::parse)
            .join();
    }

    public static String parse(String reponseBody) {
        return "String is here";
    }
}
