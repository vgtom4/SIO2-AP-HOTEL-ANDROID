package fr.vgtom.ap_hotel_android;

public class varglobale {
    // portable wifi
//    private static String ip = "192.168.68.48";
//    private static String ip = "192.168.230.48";
//    private static String ip = "192.168.1.110";
    private static String ip = "192.168.32.31";
//    private static String ip = "192.168.249.49";

    // portable usb
//    private static String ip = "192.168.143.186";

    public static String urlToAPI(String pageName, String... params) {
        String url = "http://" + ip + "/webservice/hotel/" + pageName + ".php" + (params.length > 0 ? "?" + String.join("&", params) : "");
        System.out.println("-------------------------------------------------------------------------\nURL: " + url);
        return url;
    }

    public static Integer currentHotelId = 10;
}
