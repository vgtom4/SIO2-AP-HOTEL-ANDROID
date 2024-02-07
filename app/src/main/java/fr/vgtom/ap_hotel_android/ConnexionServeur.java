package fr.vgtom.ap_hotel_android;

import android.os.AsyncTask;

import org.json.JSONArray;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class ConnexionServeur extends AsyncTask<Void, Void, String> {
    private String strurl;
    private String data = "";
    private Runnable callback;

    //Constructeur
    public ConnexionServeur(String uneurl){
        super();
        strurl = uneurl;
    }

    public void registerOnPostExecutionCallback(Runnable callback) {
        this.callback = callback;
    }

    @Override
    protected void onPostExecute(String response) {
        data = response;
        System.out.println("--------ici----------\n" + response);
        callback.run();
    }

    @Override
    protected String doInBackground(Void... voids) {
        try {
            URL url = new URL(strurl);
            HttpURLConnection cnn = (HttpURLConnection) url.openConnection();
            StringBuilder leslignes = new StringBuilder();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(cnn.getInputStream()));
            String uneligne;
            uneligne = bufferedReader.readLine();
            while (uneligne != null) {
                leslignes.append(uneligne + "\n");
                uneligne = bufferedReader.readLine();
            }
            return leslignes.toString().trim();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public String getData() {
        System.out.println("-------------------------------------------------------------------------\n" +
                            "getData: " + data);
        return data;
    }
}
