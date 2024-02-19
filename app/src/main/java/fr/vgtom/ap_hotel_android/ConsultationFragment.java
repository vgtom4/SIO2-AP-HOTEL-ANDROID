package fr.vgtom.ap_hotel_android;

import android.content.Intent;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;

import java.text.SimpleDateFormat;

import fr.vgtom.ap_hotel_android.databinding.FragmentConsultationBinding;

public class ConsultationFragment extends Fragment {
    FragmentConsultationBinding binding;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        binding = FragmentConsultationBinding.inflate(inflater, container, false);

//         Attribuer un écouteur d'évènement au bouton de consultation pour visualiser les informations de la réservation saisie
        binding.btnConsulter.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                // Récupération des informations de la réservation depuis l'API en fonction du numéro de réservation saisi
                ConnexionServeur cnnSrvReservation = new ConnexionServeur(varglobale.urlToAPI("getReservation", "numres=" + binding.txtNumRes.getText().toString()));
                cnnSrvReservation.registerOnPostExecutionCallback(new Runnable() {
                    @Override
                    public void run() {
                        gestionAffichage(cnnSrvReservation.getData());
                    }
                });
                cnnSrvReservation.execute();
            }
        });

        // Attribuer un écouteur d'évènement au bouton btnViewInfoHotel pour afficher les informations de l'hôtel
        binding.btnViewInfoHotel.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                SwitchToInfoHotel();
            }
        });

        binding.btnViewInfoHotel.setVisibility(View.INVISIBLE);

        return binding.getRoot();
    }

    // Méthode pour gérer l'affichage des informations de la réservation saisie
    private void gestionAffichage(String data) {
        try{
            EditText txtCodeAcces = getActivity().findViewById(R.id.txtCodeAcces);
            TextView lblMessage = getActivity().findViewById(R.id.lblMessage);
            TextView lblInfoReservation = getActivity().findViewById(R.id.lblInfoConsultation);

            lblMessage.setText("");
            lblInfoReservation.setText("");
            binding.btnViewInfoHotel.setVisibility(View.INVISIBLE);

            // Vérification de l'existence de la réservation
            if (data.isEmpty()){
                lblMessage.setText("Aucune réservation trouvée");
                return;
            }

            JSONObject uneReservation = new JSONObject(data);
            String codeAcces = uneReservation.getString("codeacces");

            // Vérification du code d'accès saisi
            if (codeAcces.equals(txtCodeAcces.getText().toString())){
                binding.btnViewInfoHotel.setVisibility(View.VISIBLE);
                String noresglobale, nom, mail, chambres, dateDeb = null, dateFin = null, nomHotel;
                // Stockage des informations de la réservation dans des variables
                noresglobale = uneReservation.getString("noresglobale");
                nom = uneReservation.getString("nom");
                mail = uneReservation.getString("email");
                chambres = uneReservation.getString("chambres");

                varglobale.currentHotelId = uneReservation.getInt("nohotel");
                nomHotel = uneReservation.getString("nomhotel");

                // convertion de la date en format français jour semaine jour mois année
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    dateDeb = uneReservation.getString("datedeb");
                    dateDeb = new SimpleDateFormat("EEEE dd MMMM yyyy").format(sdf.parse(dateDeb));

                    dateFin = uneReservation.getString("datefin");
                    dateFin = new SimpleDateFormat("EEEE dd MMMM yyyy").format(sdf.parse(dateFin));
                } catch (java.text.ParseException e) {
                    throw new RuntimeException(e);
                }

                // Création d'une chaîne de caractères correspondant aux chambres réservées
                String[] chambresTab = chambres.replace("\"", "").replace("[", "").replace("]", "").split(",");
                String chambresStr = "";
                for (int i = 0; i < chambresTab.length; i++) {
                    chambresStr += "n°" + chambresTab[i] + (i < chambresTab.length - 1 ? ", " : "");
                }

                // Affichage des informations de la réservation dans le TextView lblInfoConsultation
                lblInfoReservation.setText("Réservation n°" + noresglobale + "\ndans l'hôtel " + nomHotel + " :" +
                        "\n\nM./Mme " + nom +
                        "\nEmail : " + mail +
                        "\n\nDu " + dateDeb + "\nau " + dateFin +
                        "\n\nChambres réservées : \n" + chambresStr);
            } else {
                lblMessage.setText("Code d'accès incorrect");
                return;
            }
        } catch (JSONException e) {
            throw new RuntimeException(e);
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