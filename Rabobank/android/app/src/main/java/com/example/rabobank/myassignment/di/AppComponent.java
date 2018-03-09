package com.example.rabobank.myassignment.di;

import android.app.Application;

import com.example.rabobank.myassignment.RaboBankAssignmentApp;

import javax.inject.Singleton;

import dagger.Binds;
import dagger.BindsInstance;
import dagger.Component;
import dagger.android.AndroidInjector;
import dagger.android.DaggerApplication;
import dagger.android.support.AndroidSupportInjectionModule;

/**
 * Created by jibinraju on 09/03/2018.
 */
@Singleton
@Component(modules = {AndroidSupportInjectionModule.class,ActivityBuilder.class, AppModule.class})
public interface AppComponent extends AndroidInjector<DaggerApplication> {

    void inject(RaboBankAssignmentApp app);

    @Override
    void inject(DaggerApplication instance);

    @Component.Builder
    interface Builder {

       @BindsInstance
        Builder application(Application application);

        AppComponent build();

    }
}
