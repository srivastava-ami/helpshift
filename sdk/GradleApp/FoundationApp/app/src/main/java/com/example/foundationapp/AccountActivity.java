package com.example.foundationapp;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.util.Log;
import com.helpshift.Core;
import com.helpshift.HelpshiftUser;

public class AccountActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_account);
        //Helpshift Code
        final Button login = findViewById(R.id.login);
        final TextView loginlabel = findViewById(R.id.loginlabel);
        final EditText uname = findViewById(R.id.Unametext);
        final EditText uemail = findViewById(R.id.uemail);
        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                login.setText("Log out");
                loginlabel.setText("You are logged in as: ");
                String hsuname = uname.getText().toString();
                String hseamil = uemail.getText().toString();
                Log.d("Helpshift Eamil&Name: ", "Value: " + hsuname + " & " + hseamil);
                HelpshiftUser user = new HelpshiftUser.Builder( "unique-user-id-7", hseamil)
                        .setName(hsuname)
                        .build();
                Log.d("Helpshift  user detail", "Value: " + user);
                Core.login(user);

            }
        });



        // Hs done
    }
}
