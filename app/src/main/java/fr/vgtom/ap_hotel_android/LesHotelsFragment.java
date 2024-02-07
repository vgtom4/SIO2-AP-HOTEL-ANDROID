package fr.vgtom.ap_hotel_android;

import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link LesHotelsFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class LesHotelsFragment extends Fragment {

    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    public static Integer currentHotelPosition = null;
    public static JSONArray dataHotels;
    private Integer[] listIdHotels;

    public LesHotelsFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment LesHotelsFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static LesHotelsFragment newInstance(String param1, String param2) {
        LesHotelsFragment fragment = new LesHotelsFragment();
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
        ConnexionServeur cnnSrvHotel = new ConnexionServeur(varglobale.urlToAPI("getAllHotels"));
        cnnSrvHotel.registerOnPostExecutionCallback(new Runnable() {
            @Override
            public void run() {
                afficherFluxJsonDansListView(cnnSrvHotel.getData());
            }
        });
        cnnSrvHotel.execute();

        return inflater.inflate(R.layout.fragment_les_hotels, container, false);
    }

    private void afficherFluxJsonDansListView(String unechainejson) {
        try {
            ListView monlistview = requireView().findViewById(R.id.lstHotels);
            ArrayAdapter<String> adapterHotelsName = new ArrayAdapter<String>(requireContext(), android.R.layout.simple_list_item_1);
            dataHotels = new JSONArray(unechainejson);
            for (int i = 0; i < dataHotels.length(); i++) {
                JSONObject unelement = dataHotels.getJSONObject(i);
                adapterHotelsName.add(unelement.getString("nom"));
            }
            monlistview.setAdapter(adapterHotelsName);

            //Mise en place d'un écouteur d'évènement clic sur une des lignes de la liste
            monlistview.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                public void onItemClick(AdapterView<?> parent, View v, int position, long id) {
                    try {
                        varglobale.currentHotelId = dataHotels.getJSONObject(position).getInt("nohotel");
                        SwitchToInfoHotel();
                    } catch (JSONException e) {
                        throw new RuntimeException(e);
                    }
                }
            });

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void SwitchToInfoHotel(){
        FragmentManager fragmentManager = getParentFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.replace(R.id.frameLayout, new InfoHotelFragment());
        fragmentTransaction.commit();
    }
}