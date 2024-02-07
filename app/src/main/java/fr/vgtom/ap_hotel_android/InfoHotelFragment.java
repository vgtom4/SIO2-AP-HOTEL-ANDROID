package fr.vgtom.ap_hotel_android;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link InfoHotelFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class InfoHotelFragment extends Fragment {

    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;
    JSONObject unhotel = null;

    public InfoHotelFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment InfoHotelFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static InfoHotelFragment newInstance(String param1, String param2) {
        InfoHotelFragment fragment = new InfoHotelFragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        try{
            ConnexionServeur cnnSrvHotel = new ConnexionServeur(varglobale.urlToAPI("getHotel", "nohotel=" + varglobale.currentHotelId.toString()));
            cnnSrvHotel.registerOnPostExecutionCallback(new Runnable() {
                @Override
                public void run() {
                    ShowInfo(cnnSrvHotel.getData());
                }
            });
            cnnSrvHotel.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_info_hotel, container, false);
    }

    public void ShowInfo (String info) {
        try {
            TextView lblNom = (TextView) getActivity().findViewById(R.id.lblNomHotel);
            TextView lblInfo = (TextView) getActivity().findViewById(R.id.lblInfoHotel);

            System.out.println("--------ici-------ShowInfo----\n" + info);
            JSONObject unhotel = new JSONObject(info);

            String nom, adr1, adr2, cp, ville, tel, descourt, prix, nomfichierPhoto;
            nom = unhotel.getString("nom");
            adr1 = unhotel.getString("adr1");
            adr2 = unhotel.getString("adr2");
            cp = unhotel.getString("cp");
            ville = unhotel.getString("ville");
            tel = unhotel.getString("tel");
            descourt = unhotel.getString("descourt");
            prix = unhotel.getString("prix");
            nomfichierPhoto = unhotel.getString("nomfichier");

            String infosHotel = "Adresse : " + cp + " " + ville + ", "
                    + "\n" + adr1 + ((!adr2.equals("null")) ? " - \n" + adr2 : "")
                    + "\n\n" + tel
                    + "\n\n" + descourt
                    + "\n\nPrix : " + prix + "€/nuit";

            lblNom.setText("Hôtel " + nom);
            lblInfo.setText(infosHotel);

            ShowImage(nomfichierPhoto);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
    }

    ImageView imgHotel;
    public void ShowImage (String imgName) {
        imgHotel = (ImageView) requireActivity().findViewById(R.id.photoHotel);
        int resID = getResources().getIdentifier("_"+imgName.substring(0, imgName.length() - 4), "drawable", requireActivity().getPackageName());
        imgHotel.setImageResource(resID);
    }
}