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

public class LesHotelsFragment extends Fragment {
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Récupération de la liste des hôtels depuis l'API
        ConnexionServeur cnnSrvHotel = new ConnexionServeur(varglobale.urlToAPI("getAllHotels"));
        // Mise en place d'un callback pour l'affichage des données récupérées
        cnnSrvHotel.registerOnPostExecutionCallback(new Runnable() {
            @Override
            // Méthode appelée après la récupération des données
            public void run() {
                afficherFluxJsonDansListView(cnnSrvHotel.getData());
            }
        });
        cnnSrvHotel.execute();

        return inflater.inflate(R.layout.fragment_les_hotels, container, false);
    }

    // Méthode pour afficher les données récupérées dans une ListView
    private void afficherFluxJsonDansListView(String unechainejson) {
        try {
            ListView monlistview = requireView().findViewById(R.id.lstHotels);
            ArrayAdapter<String> adapterHotelsName = new ArrayAdapter<String>(requireContext(), android.R.layout.simple_list_item_1);
            JSONArray dataHotels = new JSONArray(unechainejson);
            // Parcours des données récupérées pour les afficher dans la ListView (nom des hôtels)
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

    // Méthode pour changer de fragment et afficher les informations de l'hôtel sélectionné
    private void SwitchToInfoHotel(){
        FragmentManager fragmentManager = getParentFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.replace(R.id.frameLayout, new InfoHotelFragment());
        fragmentTransaction.commit();
    }
}