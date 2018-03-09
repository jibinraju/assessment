package com.example.rabobank.myassignment.di;

import android.app.Application;
import android.content.Context;

import dagger.Binds;
import dagger.Module;

/**
 * Created by jibinraju on 09/03/2018.
 */

@Module
public abstract class AppModule {

    @Binds
    abstract Context provideContext(Application application);
}
