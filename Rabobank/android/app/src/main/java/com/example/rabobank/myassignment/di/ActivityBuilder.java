package com.example.rabobank.myassignment.di;

import com.example.rabobank.myassignment.ui.MainActivity;
import com.example.rabobank.myassignment.ui.MainActivityModule;

import dagger.Module;
import dagger.android.ContributesAndroidInjector;

/**
 * Created by jibinraju on 09/03/2018.
 */

@Module
public  abstract class ActivityBuilder {

    @ContributesAndroidInjector(modules = MainActivityModule.class)
    abstract MainActivity bindActivity();

}
