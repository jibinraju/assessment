package com.example.rabobank.myassignment;

import com.example.rabobank.myassignment.di.AppComponent;
import com.example.rabobank.myassignment.di.DaggerAppComponent;

import dagger.android.AndroidInjector;
import dagger.android.DaggerApplication;

/**
 * Created by jibinraju on 09/03/2018.
 */

public class RaboBankAssignmentApp extends DaggerApplication {

    @Override
    protected AndroidInjector<? extends DaggerApplication> applicationInjector() {
        AppComponent appComponent = DaggerAppComponent.builder().application(this).build();
        appComponent.inject(this);
        return appComponent;
    }
}
