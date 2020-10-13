package com.example.foundationapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.util.Log;
//import com.helpshift.support.Log;
import com.helpshift.support.ApiConfig;
import com.helpshift.support.Support;
import com.helpshift.support.Support.Delegate;
import java.util.HashMap;
import java.util.Map;

//class MyDelegates implements Delegate {
//    @Override
//    public void didReceiveNotification (int newMessagesCount) {
//        // your code goes here
//    }
//}

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //Helpshift code
        Button hssfaq = findViewById(R.id.showfaqs);

        hssfaq.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Map<String, String[]> customIssueFields = new HashMap<>();
                customIssueFields.put("app_name", new String[]{"sl", "Foundation App"});
                ApiConfig cifconfig = new ApiConfig.Builder()
                        .setCustomIssueFields(customIssueFields)
                        .build();
                Log.d("Helpshift CIFCONFIG", "Value: " + cifconfig);


                Support.showFAQs(MainActivity.this, cifconfig);
            }
        });

        Button hssconv = findViewById(R.id.showconversation);

        hssconv.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                MyDelegates delegates = new MyDelegates();
//                Support.setDelegate(delegates);
                Support.showConversation(MainActivity.this);
            }
        });
    }

    public void activity_account(View view) {
        startActivity(new Intent(getApplicationContext(), AccountActivity.class));
    }
}
