package com.example.foundationapp;

import android.app.Application;
import android.util.Log;
import com.helpshift.Core;
import com.helpshift.InstallConfig;
import com.helpshift.exceptions.InstallException;
import com.helpshift.support.Support;

public class hsconfig extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        InstallConfig installConfig = new InstallConfig.Builder()
                .setEnableInAppNotification(true)
                .setEnableLogging(true)
                .build();
        Core.init(Support.getInstance());
        try {
//            Core.install(this,
//                    "a36fuifu078bcb0dee2107f48b89565789",
//                    "DOMAIN.helpshift.com",
//                    "DOMAIN_platform_20190515202052121-c246aff186d60f8",
//                    installConfig);
        } catch (InstallException e){
            Log.e("ERR","Invalid credentials : ", e);}
    }
}
