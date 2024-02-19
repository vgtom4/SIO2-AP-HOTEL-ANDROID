package fr.vgtom.ap_hotel_android;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import android.os.Bundle;

import fr.vgtom.ap_hotel_android.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {
    ActivityMainBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        replaceFragment(new LesHotelsFragment());

        // Gestion des clics sur les éléments du menu de navigation en bas de l'écran
        binding.bottomNavigationView.setOnItemSelectedListener(item -> {
            if (item.getItemId() == R.id.menu_hotels)
                replaceFragment(new LesHotelsFragment());
            else if (item.getItemId() == R.id.menu_consultation)
                replaceFragment(new ConsultationFragment());

            return true;
        });
    }

//    Permet de remplacer un fragment par un autre dans le layout frameLayout de l'activité principale
    private void replaceFragment(Fragment fragment){
        FragmentManager fragmentManager = getSupportFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.replace(R.id.frameLayout, fragment);
        fragmentTransaction.commit();
    }
}