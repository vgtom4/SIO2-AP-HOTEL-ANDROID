package fr.vgtom.ap_hotel_android;

public class varglobale {
    private static String ipAdressWebservice = "ip_adress_webservice"; // ex: "192.168.1.1"
    private static String pathWebService = "/.../.../"; // ex: "/webservice/hotel/"

    public static String urlToAPI(String pageName, String... params) {
        String url = "http://" + ipAdressWebservice + pathWebService + pageName + ".php" + (params.length > 0 ? "?" + String.join("&", params) : "");
        System.out.println("-------------------------------------------------------------------------\nURL: " + url);
        return url;
    }

    public static Integer currentHotelId = 10;
}
